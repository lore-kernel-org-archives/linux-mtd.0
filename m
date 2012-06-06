Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1ScC6U-0006FP-41
 for linux-mtd@lists.infradead.org; Wed, 06 Jun 2012 09:00:34 +0000
Message-ID: <1338973437.6875.13.camel@sauron.fi.intel.com>
Subject: Re: UBIFS error: replay_log_leb: first log node at LEB 3:0 is not
 CS node
From: Artem Bityutskiy <dedekind1@gmail.com>
To: James Nute <newten82@gmail.com>
Date: Wed, 06 Jun 2012 12:03:57 +0300
In-Reply-To: <CAEg8X7XVOpyanEtkz1YPbECJTQWfamnhq4yQsyeMyeBSqUnvgw@mail.gmail.com>
References: <CAEg8X7XO4xgHravjYtswWZ0xh_o2ZvPcsT=iH=-bYoV57+ZE7w@mail.gmail.com>
 <1336744984.2625.79.camel@sauron.fi.intel.com>
 <CAEg8X7UCSoTCLyynVbRaN6Z7M6PvJn7-nBiDf+UhwmcZ91muyg@mail.gmail.com>
 <1337066521.2528.130.camel@sauron.fi.intel.com>
 <CAEg8X7XVOpyanEtkz1YPbECJTQWfamnhq4yQsyeMyeBSqUnvgw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-/xHCZRzK0ttZcEMdenaZ"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-/xHCZRzK0ttZcEMdenaZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-06-04 at 16:05 -0400, James Nute wrote:
> I wrote a quick patch to remove the call to the ubifs_fixup_free_space
> function from fs/ubifs/super.c and the problem goes away.
> I currently do not understand enough of the UBIFS internal to see why
> this particular function is at fault. Is it possible that it is
> incorrectly erasing the new master node?

Is it please possible to either provide the faulty image or enable all
debugging messages and providing the full log. Do not forget about the
ignore_loglevel options.

--=20
Best Regards,
Artem Bityutskiy

--=-/xHCZRzK0ttZcEMdenaZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPzxz9AAoJECmIfjd9wqK0adUP/0V7ny2BZ+500KuG6RVRMzmM
z4qAih3szql3oHl6CLQugOnR5cn2zmHDx66M3Wmy9QKLv7D9ZcdJcBWo9J2o1U6z
PNZUP/VstSw0DyLXsGbOXMnlOBsDyOd1Yw5IrN3G+gCsEIXwdi5YSMDwzlg6cxQi
Hsu13C1enD3lFtdisIT68PNN6YyhXB6yaDliYEYa6fDSCoTnvsIJ40g1A95nYUts
gGkNS1etGsG7T5FGDNsAZw62GL45M9HwMZbg3MH2MvKEFzpoNJBCWGFhAuPUrgbd
irtI7DkIxLEQsNxxJeGFhYgpL0z4ilc4eDVmzRj52LEdIBeMpLomUCnl36vH8IOm
wdGFZhCBQiH/EbfuBt0fNBmOLG8UhPr7gaih5RndW1dyWgh9FYUHtpGq8GRrTKep
vPF5LHvNzMkt4RQDDxql3ZHOrRxhipLykYgHehh6eMrc5b+qR6l1Q9kn8jTqR7WJ
/1LIgU9VWARLhq7oOisd3YAEiSq7Zx6hYEjrgGzI9xITISQ24isaMduUIGlwVuW3
jUf7cZo8GGHHnu94sfA6iKE8ka+FIc1tKjawv23QkLpkzb2NGkaF6AOeuaRZkbQH
79IbJxBDbC5zDmEt57PxQ4GOqY/Xbiss7IJnSg7zOxAAhAqfmQ+MpDWiMCmsyK8K
IoiUWO3kG/PjzgPO6hbi
=Sm2+
-----END PGP SIGNATURE-----

--=-/xHCZRzK0ttZcEMdenaZ--
