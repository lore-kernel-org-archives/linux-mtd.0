Received: from mail.bugwerft.de ([46.23.86.59])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fZtZL-0002wy-FC
 for linux-mtd@lists.infradead.org; Mon, 02 Jul 2018 07:48:20 +0000
Subject: Re: marvell_nand driver fails to suspend
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <68ab4512-58f2-1ade-6754-616de8d8c8d5@zonque.org>
 <9de339a6-01f9-d3a9-0271-f33933ede35b@zonque.org>
 <20180702092014.0006fee0@xps13>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <01ca9c4b-dc20-47fa-ae3c-983b3f47b28d@zonque.org>
Date: Mon, 2 Jul 2018 09:48:01 +0200
MIME-Version: 1.0
In-Reply-To: <20180702092014.0006fee0@xps13>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Miquel,

On Monday, July 02, 2018 09:20 AM, Miquel Raynal wrote:
> Daniel Mack <daniel@zonque.org> wrote on Sun, 1 Jul 2018 21:04:58 +0200:
>> On Sunday, July 01, 2018 12:18 PM, Daniel Mack wrote:
>>> I'm seeing the below error when trying to suspend and resume a PXA3xx
>>> machine booted from devicetree with the new nand driver. This used to
>>> work fine with the old driver, but admittedly, the only kernel I
>>> currently have for reference testing is very old (3.0.4), and many other
>>> things regarding nand/mtd have also changed since then.
>>>> The suspend/resume implementation in the old driver used to call into
>>> the ->suspend() and ->resume() functions of its mtd_info children
>>> directly, but looking at other drivers, it seems this is no longer
>>> needed or wanted. It also cleared all interrupts during resume, but that
>>> alone doesn't fix it in my tests.
>>>> I haven't followed the development in that area, so I'd appreciate any
>>> hint on how to fix this regression. I'm happy to test patches.
>>
>> I think I figured it out. Will send a patch.
> 
> Good to see you figured it out. Indeed there are no more suspend/resume
> callbacks, waiting for your patches to fix this.

Hmm, I got confused in my test setup last night, so no, I haven't 
figured it out yet. I've pasted the current version of the callbacks 
below, but that doesn't cut it.

The issue is easy to reproduce:

# echo mem >/sys/power/state
[wake up the device]
# sync

I'll give it a spin in a couple of days again, but if anything comes to 
your mind, please let me know.

And FTR, the device node has keep-config set for this board.


Thanks,
Daniel




static int __maybe_unused marvell_nfc_suspend(struct device *dev)
{
         struct marvell_nfc *nfc = dev_get_drvdata(dev);

         clk_disable_unprepare(nfc->core_clk);

         return 0;
}

static int __maybe_unused marvell_nfc_resume(struct device *dev)
{
         struct marvell_nfc *nfc = dev_get_drvdata(dev);
         int ret;

         ret = clk_prepare_enable(nfc->core_clk);
         if (ret < 0)
                 return ret;

         marvell_nfc_disable_int(nfc, NDCR_ALL_INT);
         marvell_nfc_clear_int(nfc, NDCR_ALL_INT);

         /*
          * Reset nfc->selected_chip so the next command will cause the 
timing
          * registers to be restored in marvell_nfc_select_chip().
          */
         nfc->selected_chip = NULL;

         return 0;
}
