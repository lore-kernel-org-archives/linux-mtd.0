Received: from proxima.lp0.eu ([2001:8b0:ffea:0:205:b4ff:fe12:530])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4DqX-0000qs-Jk
 for linux-mtd@lists.infradead.org; Wed, 02 Dec 2015 20:17:50 +0000
Subject: Re: [PATCH] mtd: brcmnand: Workaround false ECC uncorrectable errors
To: Jonas Gorski <jogo@openwrt.org>
References: <5659FF4A.7080203@simon.arlott.org.uk>
 <CAOiHx=nMZwQK9ESw9Ggqc6pHWqYQriB-t2eWq++pke8cXhvupw@mail.gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>
From: Simon Arlott <simon@fire.lp0.eu>
Message-ID: <565F51D2.4010204@simon.arlott.org.uk>
Date: Wed, 2 Dec 2015 20:17:22 +0000
MIME-Version: 1.0
In-Reply-To: <CAOiHx=nMZwQK9ESw9Ggqc6pHWqYQriB-t2eWq++pke8cXhvupw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/12/15 10:41, Jonas Gorski wrote:
> On Sat, Nov 28, 2015 at 8:23 PM, Simon Arlott <simon@fire.lp0.eu> wrote:
>> +
>> +       /* Go to start of buffer */
>> +       buf -= FC_WORDS;
>> +
>> +       /* Erased if all data bytes are 0xFF */
>> +       buf_erased = memchr_inv(buf, 0xFF, FC_WORDS) == NULL;
>> +
>> +       if (!buf_erased)
>> +               goto out_free;
> 
> We now have a function exactly for that use case in 4.4,
> nand_check_erased_buf [1], consider using that. This also has the
> benefit of treating bit flips as correctable as long as the ECC scheme
> is strong enough.

I have no idea whether or not it's appropriate to specify
bitflips_threshold > 0 so it'd just be a more complex way to do
a memchr_inv() search for 0xFF.

The code also has to check for the hamming code bytes being all 0x00,
because according to the comments [2], the controller also has
difficulty with the non-erased all-0xFFs scenario too.

[2] https://github.com/lp0/bcm963xx_4.12L.06B_consumer/blob/dd8fcb13046f738c311507dc2fcfd3e5d57a88e0/kernel/linux/drivers/mtd/brcmnand/brcmnand_base.c#L2459

> 
> Jonas
> 
> [1] https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/drivers/mtd/nand/nand_base.c#n1110
> 

-- 
Simon Arlott
