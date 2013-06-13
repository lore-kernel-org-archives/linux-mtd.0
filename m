Received: from smtp6-v.fe.bosch.de ([2a03:cc00:ff0:100::2])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Un87T-0005cb-NL
 for linux-mtd@lists.infradead.org; Thu, 13 Jun 2013 14:03:20 +0000
From: "Prins Anton (ST-CO/ENG1.1)" <Anton.Prins@nl.bosch.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Date: Thu, 13 Jun 2013 16:02:39 +0200
Subject: RE: UBIFS failure & stable page writes
Message-ID: <85D877DD6EE67B4A9FCA9B9C3A4865670C3F1A3CA7@SI-MBX14.de.bosch.com>
References: <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CB9B7@SI-MBX14.de.bosch.com>
 <1369727042.5446.112.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBE33@SI-MBX14.de.bosch.com>
 <1369732266.5446.117.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E91DC9C@SI-MBX14.de.bosch.com>
 <1369810158.5446.208.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E91E697@SI-MBX14.de.bosch.com>
 <1370239282.21714.21.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3EA0F38E@SI-MBX14.de.bosch.com>
 <51B82A1D.30009@intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3F1A3508@SI-MBX14.de.bosch.com>
 <51B862D6.2080807@intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3F1A3590@SI-MBX14.de.bosch.com>
 <51B87315.7090808@intel.com>,
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3F1A36BC@SI-MBX14.de.bosch.com>
 <ED3E0BCACD909541BA94A34C4A164D4C4FC8F091@post.tritech.se>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3F1A3C5D@SI-MBX14.de.bosch.com>
 <51B9CBFA.70103@intel.com>
In-Reply-To: <51B9CBFA.70103@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ah, right! Understood.

Then we will see "inode < UBIFS_FIRST_INO" log messages on Monday, pointing=
 to the devices that are going to fail after reboot!

This will make sense, because once applied the patches, we can check for th=
e 'log message' which makes all more deterministic (and allowes for backtra=
cing at moment of failure instead of looking 'after reboot').

Thanks!

-----Original Message-----
From: Adrian Hunter [mailto:adrian.hunter@intel.com]=20
Sent: donderdag 13 juni 2013 15:41
To: Prins Anton (ST-CO/ENG1.1)
Cc: Mats K=E4rrman; linux-mtd@lists.infradead.org; dedekind1@gmail.com
Subject: Re: UBIFS failure & stable page writes

On 13/06/13 16:31, Prins Anton (ST-CO/ENG1.1) wrote:
> We decided not to patch for this weekend, but onlty make an additional lo=
gging in UBIFS:
>
> diff -purN a/fs/ubifs/orphan.c b/fs/ubifs/orphan.c
> --- a/fs/ubifs/orphan.c	2013-06-13 12:19:58.490931170 +0200
> +++ b/fs/ubifs/orphan.c	2013-06-13 12:17:13.014931462 +0200
> @@ -300,6 +300,9 @@ static int write_orph_node(struct ubifs_
>  	for (i =3D 0; i < cnt; i++) {
>  		orphan =3D cnext;
>  		orph->inos[i] =3D cpu_to_le64(orphan->inum);
> +		if (orph->inos[i] < UBIFS_FIRST_INO) {
> +			printk(KERN_ERR "ERROR: Wrong ino in orphan list[%lu]: %lu\n", (unsig=
ned long)i, (unsigned long)orph->inos[i]);
> +		}
>  		cnext =3D orphan->cnext;
>  		orphan->cnext =3D NULL;
>  	}
>
> This to make sure if UBIFS itself writes a node '0' or '1'... and it is f=
orced by UBI, NAND, Peripheral or NAND-Device.
> If there is a relation between logging and failing after reboot it would =
make sense... Means a lot of analyzing; but we have to find it!

We know UBIFS writes the '0' or '1' because the CRC is correct.  UBIFS woul=
d
complain loudly if it were not.

>
> Next step is to apply patches and to test again:
> http://git.infradead.org/ubifs-2.6.git/commit/8afd500cb52a5d00bab4525dd5a=
560d199f979b9
> http://git.infradead.org/ubifs-2.6.git/commit/2928f0d0c5ebd6c9605c0d98207=
a44376387c298
>
> And hopefully we get rid of some unexpected orphan nodes.
>
> How realistic is it that the double orphan free causes our problem?
> Mats, are you sure the patches mentioned above are also not in your UBIFS=
?
>
>
>
