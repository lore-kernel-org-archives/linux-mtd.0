Received: from nf-out-0910.google.com ([64.233.182.185])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GT0C6-0003F5-0v
	for linux-mtd@lists.infradead.org; Thu, 28 Sep 2006 19:01:10 +0100
Received: by nf-out-0910.google.com with SMTP id l37so828343nfc
	for <linux-mtd@lists.infradead.org>;
	Thu, 28 Sep 2006 11:00:09 -0700 (PDT)
Message-ID: <67f0a57c0609281100y6b049febo69340c157b858ea4@mail.gmail.com>
Date: Thu, 28 Sep 2006 12:00:09 -0600
From: "Martin Wedepohl" <martinatgd@gmail.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: JFFS2 problem with filename length > 7
In-Reply-To: <1159392902.3309.159.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <67f0a57c0609262213j56993210h654450841dcac92f@mail.gmail.com>
	<1159337564.3309.91.camel@pmac.infradead.org>
	<67f0a57c0609271418q61d32478jff09b9a15d29e4be@mail.gmail.com>
	<1159392902.3309.159.camel@pmac.infradead.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> ... they're screwed. The dump you sent looks find -- but can you make it
> print what it sees when it reads the node from the flash in
> jffs2_get_inode_nodes()? That's where it seems to be screwed.
>

I used the JFFS2_ERROR function to debug the output and found that the
filenames are truncated in the read_direntry function.  Here is the
output.

>From looking at the offset in FLASH all the reads start on the word
0x1985e001 which looks okay.

Let me know if you need more or have any more pointers.

JFFS2 error: (872) read_direntry: already:  0: read: 10: rd->nsize: 10:
            ref_offset(ref): 0x000006bc: fd->name: aaaa
JFFS2 error: (872) read_direntry: already:  0: read:  9: rd->nsize:  9:
            ref_offset(ref): 0x00000600: fd->name: 9999
JFFS2 error: (872) read_direntry: already:  0: read:  8: rd->nsize:  8:
            ref_offset(ref): 0x00000548: fd->name: 8888
JFFS2 error: (872) read_direntry: already:  0: read:  7: rd->nsize:  7:
            ref_offset(ref): 0x00000490: fd->name: 7777777
JFFS2 error: (872) read_direntry: already:  0: read:  6: rd->nsize:  6:
            ref_offset(ref): 0x000003d8: fd->name: 666666
JFFS2 error: (872) read_direntry: already:  0: read:  5: rd->nsize:  5:
            ref_offset(ref): 0x00000320: fd->name: 55555
JFFS2 error: (872) read_direntry: already:  0: read:  4: rd->nsize:  4:
            ref_offset(ref): 0x0000026c: fd->name: 4444
JFFS2 error: (872) read_direntry: already:  0: read:  3: rd->nsize:  3:
            ref_offset(ref): 0x000001b8: fd->name: 333
JFFS2 error: (872) read_direntry: already:  0: read:  2: rd->nsize:  2:
            ref_offset(ref): 0x00000104: fd->name: 22
JFFS2 error: (872) read_direntry: already:  0: read:  1: rd->nsize:  1:
            ref_offset(ref): 0x00000050: fd->name: 1
