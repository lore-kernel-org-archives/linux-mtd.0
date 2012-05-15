Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SUC1i-0005KU-Ii
 for linux-mtd@lists.infradead.org; Tue, 15 May 2012 07:18:35 +0000
Message-ID: <1337066521.2528.130.camel@sauron.fi.intel.com>
Subject: Re: UBIFS error: replay_log_leb: first log node at LEB 3:0 is not
 CS node
From: Artem Bityutskiy <dedekind1@gmail.com>
To: James Nute <newten82@gmail.com>
Date: Tue, 15 May 2012 10:22:01 +0300
In-Reply-To: <CAEg8X7UCSoTCLyynVbRaN6Z7M6PvJn7-nBiDf+UhwmcZ91muyg@mail.gmail.com>
References: <CAEg8X7XO4xgHravjYtswWZ0xh_o2ZvPcsT=iH=-bYoV57+ZE7w@mail.gmail.com>
 <1336744984.2625.79.camel@sauron.fi.intel.com>
 <CAEg8X7UCSoTCLyynVbRaN6Z7M6PvJn7-nBiDf+UhwmcZ91muyg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-xDUjeRZQmG2J+jWc9h9z"
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


--=-xDUjeRZQmG2J+jWc9h9z
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-05-11 at 14:56 -0400, James Nute wrote:
> On Fri, May 11, 2012 at 10:03 AM, Artem Bityutskiy <dedekind1@gmail.com> =
wrote:
> > On Wed, 2012-05-09 at 09:45 -0400, James Nute wrote:
> >> Hello
> >>
> >> I'm getting a UBIFS Corruption during a power failure with a fail
> >> signature that I believe is different from what has been seen in the
> >> past.
> >> When I flash a new UBI image onto my device and boot it for the first
> >> time everything comes up as expected. However if I force a power
> >> failure before any major file writes occur the device will crash when
> >> UBIFS attempts to recover during the next reboot. If I force a sync
> >> command before the power failure I am able to successfully avert the
> >> recovery failure. I worry that this indicates something ugly is going
> >> on that I can't detect.
> >
> > Unfortunately you did not really enable the debugging messages or you
> > forgot to type "dmesg". Anyway, they are absent.
> >
> >>
> >> To get more debug messages I have enabled UBIFS debugging and enabled
> >> the recovery and mount messages by booting with
> >> ""ubifs.debug_msgs=3D6144 ignore_loglevel" kernel parameters
> >
> > Can you actually enable them and share the log?
>=20
> I did the following to enable debugging:
> 1. "CONFIG_UBIFS_FS_DEBUG=3Dy" in kernel config
> 2. Added "ubifs.debug_msgs=3D6144" to the kernel command line
> 3. Added "ignore_loglevel" to the kernel command line
> 4. Captured all console output with putty and uploaded to
> http://mcreech.com/work/ubifs-2012-05-08.txt
>=20
> I'm not sure what step I missed to enable the full debugging messages.
> I am getting some UBIFS DBG messages in my log but not many.

Did you pull the latest UBIFS from the back-port trees? In the latest
UBIFS we switch to dynamic debugging. I did not do good documentation
how to use it because of lack of time. But you can read the general
instructions in the Documentation directory.

You may as well hack ubifs and force it to use printk with KERN_ERROR to
make sure everything goes to your serial console. See the debug.h file.

> > the image and share it - I should be able to put it to nandsim and try
> > to mount and see.
>=20
> I will look into dumping the image for you but I have not done this befor=
e.
> Do you want a dump from before the power fail or after?

After the failure. The ideal is the one after the failure but _before_
you first mount it.

> > Is this problem reproducible?
> Yes I have had no trouble recreating this fail.

Hmm, then I suspect you have issues on driver level. Did you validate
your driver with MTD tests?

> I will continue to try to figure out why I am not getting all the
> debug messages.

Depends on your version. If it uses printk - I described various things
here:
http://www.linux-mtd.infradead.org/faq/ubi.html#L_how_debug

It is for UBI, but the information about printk and and log buffer is
generic.

The newest UBIFS used dynamic debugging infrastructure instead:

Documentation/dynamic-debug-howto.txt

You can enable various debugging messages using that infrastructure. See
the debug.h file in ubifs - it prefixes messages from various subsystems
- you can use them to see the messages.

Not that dynamic prints have KERN_DEBUG level and they do not go to your
serial console. You can boot with ignore_loglevel kernel option to see
_all_ the messages.

This stuff needs good documentation on the web site - many people get
confused ... :-(

--=20
Best Regards,
Artem Bityutskiy

--=-xDUjeRZQmG2J+jWc9h9z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPsgQZAAoJECmIfjd9wqK0xKYP/1k0++VPGT5GkLb71W2CePWb
vU9O1LOMm23TErCv2Wq2Rh9pFcE06tOYOaD2MY0zt7fPhJdjfBJOal+a1eLi7aPU
/TASpvq87t7Dcms7yNVyKth4oS56sZWp9aIUDqMoXdAc/OJeJAYDaVHZ+bgjzuEp
zAgrnbQ8glnEauav66nzSmJRk/mfBPWfLKgmAoyxFuB97E5lKSoopnai0F4JDy29
XUHelkL91gSIlFJNa39lPPtvHfnRIUYIBg4YHl0gMQEsJrS1kLrBYgFxo5aDDVDq
MgdBzoIBjNoqUukO3IwXfmiR5RNn8kvWCAjUqsHgnb8kvQleJN9n8T5HyYIZFyvz
1m5Vv52ZF0LYl16swSxn1R0BTXQAxbxkOxj+UWJntt1LcNPO0rZHErr/88JXgvAp
mdcJicd0iLumD0O40+8B9mWaHM7HsLkt6sIzfPue/5G+2xHo6xTeNPSOAMvbwEVA
3kxTlDx9JP9MLG86orJluIuMbhLGrihWIIL8T1hv0V6k+DPS6mhjBjoViK1b7/m9
1CIf2OAs/fPLMithg2IIsBFf1wNYXRenY8uU1jU+0uRtilpFTBGh7nsuyiV7Mjr2
Bvms/3PyvrkuTbQ4572FBcxi8X7FY9UGL8PsNFS3/RS3ZvckBFDP0YhbSOaX4WMp
xaNkiMaYXtYjS7K2BPxq
=adkp
-----END PGP SIGNATURE-----

--=-xDUjeRZQmG2J+jWc9h9z--
