Received: from mailout.fastq.com ([204.62.193.66])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 1949oB-0005hC-9R
	for <linux-mtd@lists.infradead.org>; Sat, 12 Apr 2003 02:27:55 +0100
From: Russ Dill <Russ.Dill@asu.edu>
To: "Edward A. Hildum" <ehildum@mail.arc.nasa.gov>
In-Reply-To: <5.1.1.5.2.20030411130135.018a6698@mail.arc.nasa.gov>
References: <3E9312BF.50009@mail.arc.nasa.gov>
	 <5.1.1.5.2.20030411130135.018a6698@mail.arc.nasa.gov>
Message-Id: <1050111033.4189.1.camel@russ.local>
Mime-Version: 1.0
Date: 11 Apr 2003 18:30:34 -0700
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: Ilguiz Latypov <ilatypov@infradead.org>
Subject: Re: DoC + GRUB booting problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>          The bootloader is definitely the M-Sys BIOS extension.  My 
> impression is that for DoC 2000s, the BIOS extension is in a ROM that can't 
> be changed.  I am still trying to verify that, but if its true, I have to 
> deal with it.  If it can be changed, like in a DoC Millenium, I could be in 
> business.

its not a ROM, its the first page of the DOC. Grub changes it over to
looking like a network boot rom (as apposed to looking like a hard disk)

> So far, I have only used DFORMAT as described in the GRUB/MTD Readme_doc 
> file.  I haven't tried using doc_loadbios yet, but if the BIOS extension 
> code is in ROM, I will still have to change its checksums to get it to 
> load.  Since M-Sys hasn't told me (yet) what format DFORMAT expects from 
> binary files, doc_loadbios may indeed be the best way to proceed.

I always use doc_loadbios, just don't forget to make sure there is
enough space before the NTFL


-- 
Russ Dill <Russ.Dill@asu.edu>
