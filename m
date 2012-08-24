Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T4sPr-0008VE-KT
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2012 11:51:08 +0000
Received: by bkcji2 with SMTP id ji2so570731bkc.36
 for <linux-mtd@lists.infradead.org>; Fri, 24 Aug 2012 04:51:05 -0700 (PDT)
Sender: Jiri Slaby <jirislaby@gmail.com>
Message-ID: <50376AA6.7030303@suse.cz>
Date: Fri, 24 Aug 2012 13:51:02 +0200
From: Jiri Slaby <jslaby@suse.cz>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH] ubifs: remove __DATE__ and __TIME__
References: <1344534194-16321-1-git-send-email-jslaby@suse.cz>
 <1345809271.2848.294.camel@sauron.fi.intel.com>
In-Reply-To: <1345809271.2848.294.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Michal Marek <mmarek@suse.cz>, jirislaby@gmail.com,
 linux-kernel@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>,
 linux-mtd@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08/24/2012 01:54 PM, Artem Bityutskiy wrote:
> On Thu, 2012-08-09 at 19:43 +0200, Jiri Slaby wrote:
>> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c index
>> e354832..67af316 100644 --- a/fs/ubifs/super.c +++
>> b/fs/ubifs/super.c @@ -1431,7 +1431,6 @@ static int
>> mount_ubifs(struct ubifs_info *c) ubifs_msg("reserved for root:
>> %llu bytes (%llu KiB)", c->report_rp_size, c->report_rp_size >>
>> 10);
>> 
>> -	dbg_msg("compiled on:         " __DATE__ " at " __TIME__); 
>> dbg_msg("min. I/O unit size:  %d bytes", c->min_io_size); 
>> dbg_msg("max. write size:     %d bytes", c->max_write_size); 
>> dbg_msg("LEB size:            %d bytes (%d KiB)",
> 
> Pushed to linux-ubifs.git, thanks! Does it make sense to hurry up
> and send this to 3.6? Or it can be merged to 3.7 normally?

No need to rush. We have the patch in a local queue anyway.

thanks,
- -- 
js
suse labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQIcBAEBAgAGBQJQN2qmAAoJEL0lsQQGtHBJi/EP/AxRThCd3Kbp2QS0cWlR2d81
AlYi+/TWC8P3NOjfoW3dZibn23DsZ45Dgs0MR9V1AvaKAZ81MIVE7dTQKJxalgen
R8bugSb8j9YssnuSmQaqmGgsvDXzW3VCLaGgwSVlOJ1sTJgG0A7r9/vNf1aPLG5J
oDthCQswltnyl7iRuYMLB3G1mtP+ml2rW9GyKhQfR9/380gPDsfx5PuCwjqvS3we
zn81GS54RTe0C8kROUuyIuLGN+NVPoGXQVp3IIww7cN6G/xb7WDm5sle0VNYYCiC
VQCXfApJWkOaORqKRfBHMLqfgkcaegT+uQA0ELon0T5GTfLrTGHnmijYKLbYhVK9
suUdLMOSrk5Pcu8KYmT3ti7FP+kTJE9+lJAqdCpedSBEzn88TGn+5gY9APG+Nsy2
9YkvwAelnzdRlf0AO5RXfCUua6wk/UNSNrZJDex1fflYCjBXdlneeV7akDBVqGW8
9Vklwmp5PeBtWt2kh7U9cyxDRiC55df8DKG1I/TGZ7YdtL6O+mtFegVMkc5NA2rp
DXFgYDnhthaqfGDXLHIiGTS+B7twmsVI1kwXEY/Tsga0JS7WQu6rgmbn88JJFwI4
PS7VT0EQ4ZiAH2olXu9fpFbJrI+s7ksWw5pC/4ri15wAHVZd8i5dZkhbX60XM7ns
Xd3BJrukZbugw0iiMVBv
=7Zm3
-----END PGP SIGNATURE-----
