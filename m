Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EHfrH-00032v-9T
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2005 07:00:31 -0400
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050920102436.GC2143@wohnheim.fh-wedel.de>
References: <BAY17-F171945FE7F31D429CCE8BEE8950@phx.gbl>
	<20050920102436.GC2143@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1
Date: Tue, 20 Sep 2005 14:59:43 +0400
Message-Id: <1127213984.20014.34.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: zhao forrest <zhao_fusheng@hotmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH]Add JFFS2 eraseblock header support
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-09-20 at 12:24 +0200, Jörn Engel wrote:
> > 4 old JFFS2 binaries reject mounting new JFFS2 images
> 
> Why this?

Because he changed cleanmarker to the EB header (eraseblock header). Old
binaries got confused by this since there are working no compatibility
flags in cleanmarkers. 

Moreover, we are going to implement the 1:1 mapping at the same time.

If old binary mounts new image, it starts writing its cleanmarkers, use
1:N mapping etc. A "mixed" image appears. Afterwords, if this mixed
image is being mounted on new JFFS2 binary, what poor Zhao is supposed
to do? There will be too much ugliness in the code to handle that.

> > 5 change the type of dirent/inode nodes and adding INCOMPAT flag
> > there in order to make old JFFS2 binaries reject mounting new
> > JFFS2 images for NAND flash
> Why?
This is just a hacky ugly way to implement 4. In future, we will use the
version field in the EB header, or what you have offered below.

> 
> > 6 new JFFS2 binary, when mounting an old JFFS2 image, will reject
> > mounting unless the old JFFS2 image doesn't use 1:N(N>1)mapping.
> 
> I wouldn't waste code on this.
I would just reject mounting old images as well.

> > 7 If JFFS2 finds that the version of the image is larger, it will
> > reject mounting the image
> 
> Really bad idea.  Incompatible changes won't make users rejoice.  Have
> a look at ext2:
> 	__le32	s_feature_compat; 	/* compatible feature set */
> 	__le32	s_feature_incompat; 	/* incompatible feature set */
> 	__le32	s_feature_ro_compat; 	/* readonly-compatible feature set */
> 
> The destinction between compatible, incompatible and ro-compatible
> features is done for a reason.  If a new feature is harmless to
> ignore, like EXT2_FEATURE_COMPAT_DIR_PREALLOC, there is no reason not
> to mount the filesystem.  New feature is just a performance thing,
> nothing more.
> 
> JFFS2 has the same for node types, you should know that.  Rationale is
> the same.
> 
> So if we need a version (which I was always against, as you may
> remember), we should at least express it as three sets of features.
> 
Well, nice.

You may use the 1st 4 bytes for this 1 for version, 3 for
incompat/compat/RO-compat triplet.

Joern, why didn't you offer this earlier :-) ?

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
