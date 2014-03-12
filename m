Received: from blu0-omc1-s17.blu0.hotmail.com ([65.55.116.28])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNkQB-0005Zw-2u
 for linux-mtd@lists.infradead.org; Wed, 12 Mar 2014 14:46:16 +0000
Message-ID: <BLU0-SMTP337D056766A2230A59D6971AD760@phx.gbl>
Date: Wed, 12 Mar 2014 22:45:52 +0800
From: ayaka <lxr1234@hotmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: about porting ubiblock to make squashfs work on it
References: <BLU0-SMTP222D7E8438812853BF4B0AAD880@phx.gbl>
 <20140306113334.GD532@arch.cereza>
In-Reply-To: <20140306113334.GD532@arch.cereza>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
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

 2014 03 06 19:33, Ezequiel Garcia wrote:

> 
> You can find the latest kernel patches at:
> 
> http://git.infradead.org/linux-ubifs.git
> 
I have backported that driver into my kernel(3.10.y branch), now I have
deply a squashfs on it and mount it successfully.
I wonder whether I could use any filesystem in it(like ext2 without
write). It is the greatest thing, I could have a read-only filesystem as
the lower of overlayfs in nand mtd.
It seems that ubi.block kernel parameters won't work, I just copy all
file in driver/mtd/ubi from git and include/uapi/mtd/ubi-user.h , I am
not familar with git and that tree has a delta unsolved so I failed in
99%,
what worse, that repo is quite slowly in my country.

I wise I could done overlayfs backport later.

Thanks your work and all mtd and ubi developers.


ayaka
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJTIHMcAAoJEPb4VsMIzTziPcsIAI2/DZQ3yvNkgF6F82fYvPV3
a69B54BJX7UgCJbRtCclBPJ61dacEE4mmOSDE2d5tDAdkgD5AofW3VtlIqKxlDLz
9yc6gga56/zBOEuX9lNhtqWa07HiXJ8YQX8fF+HxKooyqcn0dZHeUXxYWdNFPmPD
xk9zxE6KmqXtRPWdVCK6UNISanZhTu9uoMF3ep0M7hfgOKN9yCXF5AR095KENTFw
bKVW7MPv1qQ4PF5ivcB4thK8w/+iSXEWs8FXBCdnb3DiJSezRCYmiYQr8GAXFRXa
2dCcJPOu3K6mH1KwS7CCtf5I6xz7wFSrTJQhqOj9uD5CfTaALbZHgI24hXv1sRU=
=XLrA
-----END PGP SIGNATURE-----
