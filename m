Received: from smtp6-v.fe.bosch.de ([2a03:cc00:ff0:100::2])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UrOVP-0007U3-B8
 for linux-mtd@lists.infradead.org; Tue, 25 Jun 2013 08:21:41 +0000
From: "Prins Anton (ST-CO/ENG1.1)" <Anton.Prins@nl.bosch.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Date: Tue, 25 Jun 2013 10:21:00 +0200
Subject: RE: UBIFS failure & stable page writes
Message-ID: <85D877DD6EE67B4A9FCA9B9C3A4865670C3F546220@SI-MBX14.de.bosch.com>
References: <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CB9B7@SI-MBX14.de.bosch.com>
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
 <ED3E0BCACD909541BA94A34C4A164D4C4FC8F091@post.tritech.se>,
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3F1A3D7F@SI-MBX14.de.bosch.com>
 <ED3E0BCACD909541BA94A34C4A164D4C4FC8FD66@post.tritech.se>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3F4167DD@SI-MBX14.de.bosch.com>
 <51C005B8.3000709@intel.com>
In-Reply-To: <51C005B8.3000709@intel.com>
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

Another weekend of tests, including the patches showed no more logging of w=
riting orphan node 0.
Also the 0xdead4ead did not appear; so the patches certainly do their job!

We do not have hard evidence the missing root node is caused by this 'writi=
ng of free-ed memory'.
But at least it seems a good suspect! Because the occurrence is very low we=
 will continue testing...
(And go back mounting synchronous to get some higher occurrence...)

I'll keep you up-to-date.

Anton


-----Original Message-----
From: Adrian Hunter [mailto:adrian.hunter@intel.com]=20
Sent: dinsdag 18 juni 2013 9:01
To: Prins Anton (ST-CO/ENG1.1)
Cc: Mats K=E4rrman; linux-mtd@lists.infradead.org; dedekind1@gmail.com
Subject: Re: UBIFS failure & stable page writes

On 18/06/13 09:31, Prins Anton (ST-CO/ENG1.1) wrote:
> Last night I did do additional tests with create/remove of files in a
> while loop on a synchronous mounted UBIFS. I did NOT get any node 0 or 1
> written over this night, but obvious enough I saw some strange node id in
> the orphan area: 0xdead4ead
>=20
> 0xdead4ead Is known to me as SPINLOCK_MAGIC; but no glue why It is in the
> orphan area if node number... Is something known about 0xdead4ead?

I am afraid I have not had time to analyze the effects of the double-free
but it is reasonable to assume that UBIFS may be writing an orphan from a
structure that has been freed and therefore re-used by, for example in this
case, a spinlock.
