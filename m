Return-Path: <SRS0=fgf0=YP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A99B0CA9EA0
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Oct 2019 22:14:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 769312084B
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Oct 2019 22:14:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VSE0Jh/8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dilger-ca.20150623.gappssmtp.com header.i=@dilger-ca.20150623.gappssmtp.com header.b="XIkqrxaA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 769312084B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dilger.ca
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:To:In-Reply-To:Date:Subject:Mime-Version:Message-Id:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GsO7jBB5QblIM3jbri2l3aU+QE1EaDXRnt9NXSoOE4Q=; b=VSE0Jh/8eZLJ6prqodXNneW7q
	HMMzab8hl4KKBaZAurzUOndkRe5GHFt7DMGvFmqOjWK21nvdfGnCNGOZ5qXZjB4UPREOBidLTppeo
	sX0TRmA21QiwnV5jTSkmbztDASmZqALf6qlIzTwBlVSDVjImH9MXD3O2Ex+69XTl8rsgxvamgfmXa
	VRV1THdwlmPUfbSnSrPjptSgwZX+lfzIAvVl5PeLKsHYY/LMox738QcgGtoOizDeleA+CcQCxDRuW
	pRGD9lHXPYdG+1TkH4m/3X3Senr6P2Jqa0YQTJ1Y7teiRZJDDoUr3XYd7bauZy+wqSZSU82Sd4hHc
	6+K2ozu5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iN2Py-0004Mx-Q0; Tue, 22 Oct 2019 22:14:18 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iN2Pt-0004ME-QW
 for linux-mtd@lists.infradead.org; Tue, 22 Oct 2019 22:14:16 +0000
Received: by mail-pg1-x544.google.com with SMTP id r1so10783929pgj.12
 for <linux-mtd@lists.infradead.org>; Tue, 22 Oct 2019 15:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dilger-ca.20150623.gappssmtp.com; s=20150623;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=jdSjvTdb7YhhV+yeBoGT2uoOFpXOTdsEt8mUL1v5JjU=;
 b=XIkqrxaAVGv4cKdfDL9k/xAlmXBfmv2xaqBwDFkiO+RuiaJ/qx8Qv68C18O/MO1irW
 Cy3Vn+tIJxOtFj8DY52CQH0sqz1B3iiTZccOjh0yUYyHLsKbUqIOJZkP1hpBi5FJn608
 BEKbvyyNE55qhvNvrbZH2IZmNn1WRfEs8EFa630Z7qZk27nOSVksTd9wxV/XGh89QoMm
 Za0X342Laxsi4tJ3eJWdVY07aJeei3nhk9yeONMbDuwXBHxa9DmHFXabN91oSXoIjD1+
 8erSnFeO/EhdCZAlrBE7LptFLs02TiPVVGY+Laj64nj95GyisCNv2t0bm1swjOyHxZ8j
 6L/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=jdSjvTdb7YhhV+yeBoGT2uoOFpXOTdsEt8mUL1v5JjU=;
 b=lX0oJMZRLyCAxHg97smxdLvGR/HRXL4899XxMAnhjdUZe0ivalyZy9IsCvCvesIv5N
 QOh4n8AsZjv/P5mLvaL/Hzzg1puvi+21pCX7GiSdkNeKAzUn/YXKoG1CA8fYgo0xYg2n
 J2epPwu0ItMa6nGsKYBEMD8Uf3RhuUX29gy7aox2Hg5h8m4GXQEVZ9b1JFH4LUWA36K/
 ByFFCgczvJ/jUHqSD6haRBWwJh6mPq8mm2if27AIZNfMrst0CTxT9h22s2Xx4+whb204
 dX4l20g3UsnQzOhdhgW6R1E7WOjiu7kaejUbYE+noNx3HZin0fZt/eNC9I3L8SjQgM9b
 O54g==
X-Gm-Message-State: APjAAAWXBx39YFl8LYCKPek7GEg7k9i9HFY6yYbwOITre4jD+fQ7jBPw
 k9jgcDJTpjau33KA/AMdGGxTIQ==
X-Google-Smtp-Source: APXvYqyCGFGpT2C3cY7XT0d1Dal+bVUH3K7BRELFdnAX59mbUm04n1z8zWdaK4LGbMaAkUt/N9526w==
X-Received: by 2002:a17:90a:a60f:: with SMTP id
 c15mr7467310pjq.18.1571782451665; 
 Tue, 22 Oct 2019 15:14:11 -0700 (PDT)
Received: from cabot-wlan.adilger.int (S0106a84e3fe4b223.cg.shawcable.net.
 [70.77.216.213])
 by smtp.gmail.com with ESMTPSA id r24sm21302038pfh.69.2019.10.22.15.13.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 Oct 2019 15:14:10 -0700 (PDT)
From: Andreas Dilger <adilger@dilger.ca>
Message-Id: <8CE5B6E8-DCB7-4F0B-91C1-48030947F585@dilger.ca>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH v14 1/5] Add flags option to get xattr method paired to
 __vfs_getxattr
Date: Tue, 22 Oct 2019 16:13:53 -0600
In-Reply-To: <20191022204453.97058-2-salyzyn@android.com>
To: Mark Salyzyn <salyzyn@android.com>
References: <20191022204453.97058-1-salyzyn@android.com>
 <20191022204453.97058-2-salyzyn@android.com>
X-Mailer: Apple Mail (2.3273)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191022_151413_871469_7D272816 
X-CRM114-Status: GOOD (  16.03  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Latchesar Ionkov <lucho@ionkov.net>, Hugh Dickins <hughd@google.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Mike Marshall <hubcap@omnibond.com>, James Morris <jmorris@namei.org>,
 devel@lists.orangefs.org, Eric Van Hensbergen <ericvh@gmail.com>,
 Joel Becker <jlbec@evilplan.org>, Anna Schumaker <anna.schumaker@netapp.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Mathieu Malaterre <malat@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jan Kara <jack@suse.com>, Casey Schaufler <casey@schaufler-ca.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dave Kleikamp <shaggy@kernel.org>,
 linux-doc@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
 Mimi Zohar <zohar@linux.ibm.com>, CIFS <linux-cifs@vger.kernel.org>,
 Paul Moore <paul@paul-moore.com>, "Darrick J . Wong" <darrick.wong@oracle.com>,
 Eric Sandeen <sandeen@sandeen.net>, kernel-team@android.com,
 Chao Yu <chao@kernel.org>, selinux@vger.kernel.org,
 Brian Foster <bfoster@redhat.com>, reiserfs-devel@vger.kernel.org,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 Jonathan Corbet <corbet@lwn.net>, linux-f2fs-devel@lists.sourceforge.net,
 Benjamin Coddington <bcodding@redhat.com>, linux-integrity@vger.kernel.org,
 Martin Brandenburg <martin@omnibond.com>, Chris Mason <clm@fb.com>,
 linux-mtd@lists.infradead.org, linux-afs@lists.infradead.org,
 Miklos Szeredi <miklos@szeredi.hu>, Ilya Dryomov <idryomov@gmail.com>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>,
 Stephen Smalley <sds@tycho.nsa.gov>, Serge Hallyn <serge@hallyn.com>,
 Eric Paris <eparis@parisplace.org>, ceph-devel <ceph-devel@vger.kernel.org>,
 Gao Xiang <xiang@kernel.org>, linux-nfs <linux-nfs@vger.kernel.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>,
 samba-technical <samba-technical@lists.samba.org>,
 linux-xfs <linux-xfs@vger.kernel.org>, Bob Peterson <rpeterso@redhat.com>,
 Tejun Heo <tj@kernel.org>, linux-erofs@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, ocfs2-devel@oss.oracle.com,
 jfs-discussion@lists.sourceforge.net, Jan Kara <jack@suse.cz>,
 Eric Biggers <ebiggers@google.com>,
 Dominique Martinet <asmadeus@codewreck.org>,
 overlayfs <linux-unionfs@vger.kernel.org>, David Howells <dhowells@redhat.com>,
 linux-mm <linux-mm@kvack.org>, Andreas Gruenbacher <agruenba@redhat.com>,
 Sage Weil <sage@redhat.com>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, cluster-devel@redhat.com,
 Steve French <sfrench@samba.org>, v9fs-developer@lists.sourceforge.net,
 Bharath Vedartham <linux.bhar@gmail.com>, Jann Horn <jannh@google.com>,
 ecryptfs@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
 Dave Chinner <dchinner@redhat.com>, David Sterba <dsterba@suse.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, netdev@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>, Tyler Hicks <tyhicks@canonical.com>,
 linux-security-module@vger.kernel.org,
 Phillip Lougher <phillip@squashfs.org.uk>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-btrfs <linux-btrfs@vger.kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: multipart/mixed; boundary="===============7052337116276227858=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7052337116276227858==
Content-Type: multipart/signed;
 boundary="Apple-Mail=_37420EF0-273E-43F4-97D0-62F6238C01CC";
 protocol="application/pgp-signature"; micalg=pgp-sha256


--Apple-Mail=_37420EF0-273E-43F4-97D0-62F6238C01CC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


On Oct 22, 2019, at 2:44 PM, Mark Salyzyn <salyzyn@android.com> wrote:
>=20
> Replace arguments for get and set xattr methods, and __vfs_getxattr
> and __vfs_setaxtr functions with a reference to the following now
> common argument structure:
>=20
> struct xattr_gs_args {
> 	struct dentry *dentry;
> 	struct inode *inode;
> 	const char *name;
> 	union {
> 		void *buffer;
> 		const void *value;
> 	};
> 	size_t size;
> 	int flags;
> };

As part of this change (which is touching all of the uses of these
fields anyway) it would be useful to give these structure fields a
prefix like "xga_" so that they can be easily found with tags.
Otherwise, there are so many different "dentry" and "inode" fields
in various structures that it is hard to find the right one.

> #define __USE_KERNEL_XATTR_DEFS
>=20
> -#define XATTR_CREATE	0x1	/* set value, fail if attr already =
exists */
> -#define XATTR_REPLACE	0x2	/* set value, fail if attr does =
not exist */
> +#define XATTR_CREATE	 0x1	/* set value, fail if attr already =
exists */
> +#define XATTR_REPLACE	 0x2	/* set value, fail if attr does =
not exist */
> +#ifdef __KERNEL__ /* following is kernel internal, colocated for =
maintenance */
> +#define XATTR_NOSECURITY 0x4	/* get value, do not involve security =
check */
> +#endif

Now that these arguments are separated out into their own structure,
rather than using "int flags" (there are a million different flags in
the kernel and easily confused) it would be immediately clear *which*
flags are used here with a named enum, like:

enum xattr_flags {
	XATTR_CREATE	=3D 0x1,	/* set value, fail if attr =
already exists */
	XATTR_REPLACE	=3D 0x2,	/* set value, fail if attr does =
not exist */
#ifdef __KERNEL__ /* following is kernel internal, colocated for =
maintenance */
	XATTR_NOSECURITY=3D 0x4,  /* get value, do not involve security =
check */
#endif
};

and use this in the struct like:

struct xattr_gs_args {
	struct dentry	*xga_dentry;
	struct inode	*xga_inode;
	const char	*xga_name;
	union {
		void		*xga_buffer;
		const void	*xga_value;
	};
	size_t		 xga_size;
	enum xattr_flags xga_flags;
};

Beyond the benefit for the reader to understand the code better, this
can also allow the compiler to warn if incorrect values are being
assigned to this field.

Cheers, Andreas






--Apple-Mail=_37420EF0-273E-43F4-97D0-62F6238C01CC
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - http://gpgtools.org

iQIzBAEBCAAdFiEEDb73u6ZejP5ZMprvcqXauRfMH+AFAl2vfyEACgkQcqXauRfM
H+AxqxAAq6h17WEPF6r1UpAZIwUiPfdUH5qvEj5YwdktQwWuj4vM4AD1SnRYnDv2
erszJKsHxSS8RBP18hvIK3TC7Z1TwOPYxRcZb1KRnxX0TthhtHTNL103RmQvUvKm
8KjV2ZmRZAlgrvw09BGHJF4f4ina+Ua1AQsIg7l+6eGjBHJ3Nvjmv3M/Eca3Y9Gx
eWYOM5vlA7+eVqKpCEyQ+/EN5lhBOWA+qsQhfEyPjSns/VsVae7bWkUrZSIRHpk9
i7HCwOkDj9cmfU4iZ34JePW8dtqHfoq3ECMUvsO681CznbyWB7yDnmX+UL8OFw2s
Vj2n0fIHc/r3SJ87LF/k5JhjWaYM4rCM+1+uzXmukWQWXIU2U2vkLdAPkyibo6nq
5/Z98+GzWMwnP9esRhIM1lAf2Q0QQ/Bmmz5/2rwCEYpleEKInHDZyJ3ddSCC9mxQ
+bf/9EeqBVd7b2R8rQLNcrY9R5zewIE+NovyaCcz71H6lyQ/NwfAAlUrjXN6zjGo
aZYq3D2plzK5PnJwZrmarfiI2Qtge9h2sbFNX2dRT6oLeZNzv/rAx/8AueYIcGjb
bPlf+rGFqzCVPkUQFPYqlsa/oEqUTnmr+6p8FvKO8DJhdVZEuOn/vJZV4e903hHl
VURWEhW1Djzh/zWJVrNeOQRk+0KBXXfgvZ9nHpMRbX0xESTU+cY=
=8Giq
-----END PGP SIGNATURE-----

--Apple-Mail=_37420EF0-273E-43F4-97D0-62F6238C01CC--


--===============7052337116276227858==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7052337116276227858==--

