Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jkcif-0005lb-NY
	for linux-mtd@lists.infradead.org; Sat, 12 Apr 2008 10:12:26 +0000
Subject: Re: Is there possible to integrate mtd ubi ubifs latest version in
	one git tree?
From: Artem Bityutskiy <dedekind@infradead.org>
To: Nancy <nancydreaming@gmail.com>
In-Reply-To: <1207994233.5965.124.camel@sauron>
References: <bae050c10804102348sceaef1bh557ecce22a96b03f@mail.gmail.com>
	<1207994233.5965.124.camel@sauron>
Content-Type: text/plain; charset=utf-8
Date: Sat, 12 Apr 2008 13:10:42 +0300
Message-Id: <1207995042.5965.136.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2008-04-12 at 12:57 +0300, Artem Bityutskiy wrote:
> If you do not want to loose UBIFS history, you could do like this
> # cd /home/nanxy/ubifs-v2.6.24
> # git format-patch v2.6.24
> This will give you huge amount of patches, basically all patches which
> we applied to vanilla linux-2.6.24. Now you may apply them to your
> linux-2.6.24.3. The easiest way is to use git-am. But first you have to
> make sure your linux-2.6.24.3 is a git repository. If it is not (you
> downloaded it as a tar.gz file, create a git repository using git
> init-db and then git commit).
>=20
> # cd /home/nancy/linux-2.6.24.3
> # git init-db
> # git add .
> # git-commit -a

Well, you might as well use quilt, which is an extremely helpful tool.
So you have many patches in /home/nanxy/ubifs-v2.6.24, like
"0061-UBIFS-use-qstr-for-name-length-pairs.patch". What you can do is:

# ls -1 0* > series
# cd /home/nancy/linux-2.6.24.3
# mkdir patches
# mv /home/nanxy/ubifs-v2.6.24/series patches/
# mv /home/nanxy/ubifs-v2.6.24/0* patches/
# quilt push -a

If there are conflicts, it is easier to resolve them with quilt. Often
it is just about "quilt push; quilt refresh".

Ant after you resolved all conflicts, and all patches apply cleanly (use
quilt refresh), you may incorporate all patches to git:

# quilt pop -q
# git reset --hard
# git quiltimport

And you now may delete patches/ and .pc which is private quilt working
directory.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
