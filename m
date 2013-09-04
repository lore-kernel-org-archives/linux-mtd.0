Received: from mail1.bemta8.messagelabs.com ([216.82.243.198])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VHFIb-0000eu-5r
 for linux-mtd@lists.infradead.org; Wed, 04 Sep 2013 15:47:18 +0000
Message-ID: <522755DC.4000301@digi.com>
Date: Wed, 4 Sep 2013 17:46:36 +0200
From: Hector Palacios <hector.palacios@digi.com>
MIME-Version: 1.0
To: Marek Vasut <marex@denx.de>
Subject: Re: gpmi-nand driver and jffs2 support
References: <522062B4.4080709@digi.com> <201309041600.37107.marex@denx.de>
 <20130905024145.GA5913@gmail.com> <201309041638.52680.marex@denx.de>
In-Reply-To: <201309041638.52680.marex@denx.de>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "fabio.estevam@freescale.com" <fabio.estevam@freescale.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Fabio Estevam <festevam@gmail.com>, Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "scottwood@freescale.com" <scottwood@freescale.com>,
 Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Marek,

On 09/04/2013 04:38 PM, Marek Vasut wrote:
> Dear Huang Shijie,
>
>> On Wed, Sep 04, 2013 at 04:00:36PM +0200, Marek Vasut wrote:
>>> Dear Huang Shijie,
>>> How come hector was then able to write his JFFS2 partition ?
>>
>> If he uses the gpmi, he should not write the JFFS2, since the gpmi
>> does not support the jffs2. He will get the failure in the end.
>
> Hector, can you comment on this?

I don't think I'm following these comments. The facts are:
1) A JFFS2 filesystem image written with nandwrite (mtd-utils v1.5.0)
	a) does not mount on kernel v3.10
	b) mounts OK on linux-next kernel (v3.12) with the patchset [1] from Huang
	(actually I didn't use linux-next but instead a v3.10 where I merged all the commits 
done to MTD in linux-next, which are a lot).

2) A JFFS2 filesystem image written with U-Boot v2013.01
	a) mounts OK on old FSL kernel 2.6.35
	b) does not mount on kernel v3.10 (neither on v3.8, I believe).
	c) does not mount on linux-next with the patchset [1]

[1] http://lists.infradead.org/pipermail/linux-mtd/2013-August/048360.html

Marek, could you please confirm 2b on your side, just in case I'm doing anything wrong 
in my custom U-Boot?


>>>> So the jffs2 support is compatiable all the time.
>>>
>>> Is the old Freescale 2.6.35 GPMI NAND format compatible with the one
>>> after applying this patchset?
>>
>> Not compatible.
>>
>> This patch set is still underreview.
>
> So this patch breaks compatiblity with FSL kernel release? This needs fixing,
> otherwise it's impossible to do a drop-in replacement for the ancient FSL
> kernel.
>
>>>>> that I could mount with Linux 3.7 and earlier?
>>>>
>>>> I think the mount can be succeeded.
>>>
>>> Ok, does that mean that we need this patchset in U-Boot in order to
>>> properly write JFFS2 onto GPMI NAND there? Is that the message you
>>> wanted to relay to us?
>>
>> Besides this patchset, the u-boot needs more patches to sync with the
>> kernel mtd code. Such as the full-id features.
>
> Can you elaborate on this more? This is very vague, I would like to know what
> exactly is missing.

Yes, please, we need more details. This seems to be related with how the MTD drivers 
(in Linux and in U-Boot) access the OOB area to store the JFFS2 cleanmarkers, right?

The error I'm receiving from the kernel is at fs/jffs2/wbuf.c

if (!oinfo || oinfo->oobavail == 0) {
     pr_err("inconsistent device description\n");
     return -EINVAL;
}

Best regards,
--
Hector Palacios
