Received: from mail0.epfl.ch ([128.178.50.57])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17SvIj-00030p-00
	for <linux-mtd@lists.infradead.org>; Fri, 12 Jul 2002 08:57:17 +0100
Received: from fred by rhin with local (Exim 3.35 #1 (Debian))
	id 17SvIi-0002cs-00
	for <linux-mtd@lists.infradead.org>; Fri, 12 Jul 2002 09:57:16 +0200
Date: Fri, 12 Jul 2002 09:57:16 +0200
From: Frederic Gobry <frederic.gobry@smartdata.ch>
To: linux-mtd@lists.infradead.org
Subject: Re: mmap question
Message-ID: <20020712075715.GA9952@rhin>
References: <20020604132254.GA4911@rhin.smartdata.ch> <20020701131443.GA10227@rhin> <20020711161909.GA8143@rhin> <20020711191540.GA16466@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Content-Disposition: inline
In-Reply-To: <20020711191540.GA16466@wohnheim.fh-wedel.de>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> 0x80 is the status register, you are reading. The command set (Intel
> or Amd, I suppose) can read it, handle any errors (0x80 mean no errors
> on intel) and return to read mode by writing 0xff to the flash.

Mmmm, this enlightens the situation. I was fearing some cache problem...

> My guess is that you command set has a bug. Fix it or provide a spec
> and some beer and pizza. ;-)

The base code uses cfi_probe: it seemed to me the command set is
determined and provided automatically, isn't it ?

I think it's more because I interfere with the "canonical" way MTD
handles the flash: I access directly the memory after the erase or
write operation (via mmap, *not* via a read system call), but from the
code in do_read_onechip (cfi_cmdset_0001.c), it seems the flash is set
to read mode not when the erase or write operation is finished, but
before an actual read must be performed (which makes sense).

I can work around this for my program (I just tested, performing a
simple read just after the write restores what is seen in the mmapped
memory), but I still would like to know if the MTD API could be
augmented in order to handle read-only memory mapped areas (when
available) in a cleaner way as what I currently do?  I don't think
this would imply lots of changes:

      - a flag indicating if the flash can be mmapped

      - the implementation  of mmap (which probably would  need a call
        similar  to  'point'  but  with an  explicit  semantic  toward
        mmapping.

      - possibly another  flag to indicate  that an area  is currently
        mmapped, so that the erase / write operations set the flash in
        read mode once they have finished their duty

Fr=E9d=E9ric

PS : where can I send the beer and pizza ? :-)

--=20
Fr=E9d=E9ric Gobry    SMARTDATA    	 =20
      ---         http://www.smartdata.ch
Software Engineer Lausanne - Switzerland
                  +41 21 693 84 98
				 =20

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9LovbFjQHpltE9KURArpIAJ9jjHDsf+2PHAGn3Nk67/aLUg9ujQCgiPZc
GsSgCSxMGQUj77f3tbBwWm0=
=gxzJ
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--
