Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ed377-0000ev-Jg
 for linux-mtd@lists.infradead.org; Sun, 21 Jan 2018 00:03:59 +0000
Received: by mail-ot0-x244.google.com with SMTP id t35so4533707otd.13
 for <linux-mtd@lists.infradead.org>; Sat, 20 Jan 2018 16:03:45 -0800 (PST)
Subject: Re: [PATCH v3] mtd: nand: brcmnand: Disable prefetch by default
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Kamal Dasu <kdasu.kdev@gmail.com>, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, richard@nod.at,
 stable@vger.kernel.org, marek.vasut@gmail.com, cyrille.pitchen@wedev4u.fr,
 computersforpeace@gmail.com, dwmw2@infradead.org
References: <1515443808-31105-1-git-send-email-kdasu.kdev@gmail.com>
 <71de78c5-0081-a663-2383-638832766001@gmail.com>
 <20180121005321.313ebc2c@bbrezillon>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <8fad16e0-21a3-e1a9-ca7c-4f2a20be6c68@gmail.com>
Date: Sat, 20 Jan 2018 16:03:41 -0800
MIME-Version: 1.0
In-Reply-To: <20180121005321.313ebc2c@bbrezillon>
Content-Type: text/plain; charset=windows-1252
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



On 01/20/2018 03:53 PM, Boris Brezillon wrote:
> On Sat, 20 Jan 2018 15:13:35 -0800
> Florian Fainelli <f.fainelli@gmail.com> wrote:
> 
>> On 01/08/2018 12:36 PM, Kamal Dasu wrote:
>>> Brcm nand controller prefetch feature needs to be disabled
>>> by default. Enabling affects performance on random reads as
>>> well as dma reads.
>>>
>>> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
>>> Fixes: 27c5b17cd1b1 ("mtd: nand: add NAND driver "library" for Broadcom STB NAND controller")
>>> Cc: stable@vger.kernel.org  
>>
>> Boris, is there a reason this is not in your v4.16 pull request?
> 
> Look carefully, it is there ;-).

Indeed, I can't read, my bad.
-- 
Florian
