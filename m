Received: from sitemail3.everyone.net ([216.200.145.37] helo=omta04.mta.everyone.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 177VdE-0008RV-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 May 2002 07:17:56 +0100
Content-Type: text/plain
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Date: Mon, 13 May 2002 23:17:54 -0700 (PDT)
From: Jim Zeus <zeusj@firstlinux.net>
To: zeusj@firstlinux.net, "David  Woodhouse" <dwmw2@infradead.org>,
	"David  Woodhouse" <dwmw2@infradead.org>
Cc: all in MTD mailinglist <linux-mtd@lists.infradead.org>
Subject: Re: misc question about MTD
Reply-To: zeusj@firstlinux.net
Message-Id: <20020514061754.D12882756@sitemail.everyone.net>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi,David

  thank you for your explanation, I have got what you said 

>and if _that_ has 'Q' 'R' 'Y' for data you assume
>they're the same chip, otherwise not.

I think its just "assume" , If the Chip A and Chip B got QRY on the same location for data ,they will be still regarded as same chip,  and that's the "FIXME" in your code means,isnt it:)

   I think before mount the flash should be erased automatically ,but  when I mount my flash (the mtd0 and mtdblock0 are all ok), I got the following message:
>jffs_scan_flash(): Did not find even a single chunk of free space. This is BAD!
>jffs_scan_flash(): Leaving...
>jffs_scan_falsh():Free size accounting screwed
>jfffs_scan_flash():free_chunk_size1 == 0x800000, free_chunk_size2 == 0x0, fmc->f
ree_size == 0x0
Why the flash is still dirty?

and when I was reading code of jffs_scan_flash , I meet the "flipping bits", you know , in the if-else phrase to detect flipping bits:
>if((((__u32)(pos - start)) != 0)){
>....
>}else{
>/* "Flipping bits" detected. This means that our scan for them
>   did not catch this offset. See check_partly_erased_sectors() for
>   more info.
>*/
I analysed all the case ,but I think that's impossible to enter the "else" bracket theoretically 
Did I miss something or there is something special for the hardware?

Thanks

Jim Zeus






_____________________________________________________________
Want a new web-based email account ? ---> http://www.firstlinux.net

_____________________________________________________________
Promote your group and strengthen ties to your members with email@yourgroup.org by Everyone.net  http://www.everyone.net/?btn=tag
