Received: from mo6-p05-ob.rzone.de ([2a01:238:20a:202:5305::1])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UZazl-0003bL-E0
 for linux-mtd@lists.infradead.org; Tue, 07 May 2013 06:03:28 +0000
Message-ID: <51889901.4080505@denx.de>
Date: Tue, 07 May 2013 08:02:41 +0200
From: Stefan Roese <sr@denx.de>
MIME-Version: 1.0
To: Brian Pomerantz <bapper@gmail.com>
Subject: Re: [PATCH] UBI: fastmap convert used list to rb tree
References: <1367801267-15659-1-git-send-email-bapper@gmail.com>
 <CAFLxGvzqysw2ABxA9Mz6b6LOdQdGS4y+fN=UeJ0tuk=KPYO55Q@mail.gmail.com>
 <1BB4A15D-C030-4CDC-B5C6-8C687572ACB7@gmail.com>
 <CAFLxGvy2icxuGx9+VaiTgFxPwL3pHOEXo6S2UG-tJvoB+GdRCg@mail.gmail.com>
 <B5D1657C-FF53-431E-AF13-5EC929791B66@gmail.com>
In-Reply-To: <B5D1657C-FF53-431E-AF13-5EC929791B66@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: richard -rw- weinberger <richard.weinberger@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/06/2013 05:27 PM, Brian Pomerantz wrote:
>> Did you port fastmap to u-boot?
>>
> 
> I didn't, though if it's not upstream then perhaps one of my colleagues
> did.  From what I can tell, it's nearly identical code to what is in the
> kernel.

Yes, the UBI code in U-Boot is a slightly modified version of the Linux
UBI code. But pretty old (from 2008). And mainline U-Boot UBI currently
has no fastmap support.

Brian, could you please let me know which U-Boot version you are using?
It would be great to see this fastmap support merged back into mainline.

Thanks,
Stefan
