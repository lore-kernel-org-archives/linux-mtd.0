Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16ahg0-0001cb-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Feb 2002 18:29:12 +0000
Date: Tue, 12 Feb 2002 19:40:17 +0100 (MET)
From: Robert Kaiser <rob@sysgo.de>
To: linux-mtd@lists.infradead.org
cc: David Woodhouse <dwmw2@infradead.org>,
   J?rn Engel <joern@wohnheim.fh-wedel.de>
Subject: MTD concat layer
Message-ID: <Pine.LNX.4.21.0202121938210.25544-102000@dagobert.svc.sysgo.de>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="380371457-306683353-1013539217=:25544"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
  Send mail to mime@docserver.cac.washington.edu for more info.

--380371457-306683353-1013539217=:25544
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

Hi,

attached is my first version of the MTD "concatenation layer".
This basically allows to build virtual MTD devices by concatenating
existing ones, so it is -in a way- the opposite of partitioning.
I would like to add this to the MTD CVS and so I'm asking people
to have a look at it.

I see two possible uses for this:

1) Having flash filesystem volumes span multiple physical chips
   I have recently seen several people ask for this on the mailing list.

2) Allow re-ordering of blocks in flash chips.
   This is my personal reason for writing this code.  It requires
   some explanation:

   I have this cute DIL/NetPC module that -for technical reasons-
   has it's BIOS right in the middle of the 2MB flash. The mapping
   driver creates partitions reflecting this hardware-imposed map.
   However, this map is very unfortunate in many cases. Specifically,
   it would be nice if one could move the BIOS block out of the way
   and treat the flash portions below and above that BIOS block as
   one contiguous device that can then be partitioned arbitrarily.
   The concat layer allows just that: I can concatenate the physical
   partitions into a single device, specifying the sequence such
   that the BIOS block appears at the end and then re-partition
   that new (virtual) device as to my heart's desire :-)


Q: Why not do this in the mtdpart layer ?

David suggested at some point that this should be done in the
partitioning layer:

dwmw2 said:
> It doesn't need to be an extra layer. Splitting a single device into=20
> multiple 'partitions' and building a big 'partition' from multiple device=
s=20
> are just two cases of the same thing - munging the offsets and passing th=
e=20
> request off to a 'master' device.=20

I tried to hack up the mtdpart.c accordingly, but came to the conclusion
that it is impossible to implement this without causing significant
overhead for parties that use only partitioning or only concatenating,
so it seemed cleaner to do it in a seperate layer. Moreover, the current
partitionining layer is scheduled to be replaced in the near future by
J=F6rn Engel's code, so I thought it best to stay clear of that layer of
code.

There are two patches attached to this mail:

1) patch-mtd-concat

This contains the actual concat layer. It also modifies the sc520cdp.c
mapping driver to demonstrate how use it by concatenating
the sc520cdp's two flash banks into one MTD device.

The concat code is in drivers/mtd/mtdconcat.c
This code defines two extenal functions:

-mtd_concat_create() to build a virtual MTD device by concatenating
 existing MTD devices.

-mtd_concat_destroy() to destroy an MTD object obtained from
 mtd_concat_create()

There is a header file (incluce/linux/mtd/concat.h) defining the
prototypes of these functions.

2) patch-mtd-concat-part

This patch modifies the DIL/NetPC mapping driver to re-order flash
blocks as described above. It also modifies the partitioning layer
(which is why I've made this a seperate patch): The current partitioning
layer has the habit of always registering the partitions as MTD devices
and not giving the caller access to the device objects it creates. I've
changed this (in a backward compatible way) because I do not want the
intermediate layers (i.e. the physical partitioning) to appear
as MTD devices. (I believe J=D6rn's new partitioning code deals with this
too, though probably in a different way.)

Shortcomings I'm aware of so far (suggestions welcome):

* Currently, all sub-devices are expected to be of the same type.
  It might be reasonable to allow concatenating certain combinations
  of different types, where the super device would be assigned a
  "least common denominator" type (i.e. if combining ROMs with flashes,
  would yield a ROM, etc.).

* I'm not sure how to assign flags to the concatenated device. Right now,
  all but the writeablility flag have to be the same.

* Currently, all sub-devices are expected to have the same OOB and
  ECC info. I must admit that I don't have enough clue about these
  things to tell wether it might make sense to concatenate devices
  with differring OOB and/or ECC info. So by default, I'm not allowing it.

* The readv()/writev() functions are not implemented. The reason is that
  so far I could not conceive of a way to do this that would not result
  in terribly messy code. Also, it is my impression that these functions
  are not very important anyway (I might be wrong, here..).


Thanks for any suggestions

Rob

----------------------------------------------------------------
Robert Kaiser                          email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14
D-55270 Klein-Winternheim / Germany    fax:   (49) 6136 9948-10

--380371457-306683353-1013539217=:25544
Content-Type: APPLICATION/x-gunzip; name="patch-mtd-concat.gz"
Content-Transfer-Encoding: BASE64
Content-ID: <Pine.LNX.4.21.0202121940170.25544@dagobert.svc.sysgo.de>
Content-Description: 
Content-Disposition: attachment; filename="patch-mtd-concat.gz"

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
AcIzLOarGzwWMxwuLwtF4m78Lz5LuuyWRgAA
--380371457-306683353-1013539217=:25544
Content-Type: APPLICATION/x-gunzip; name="patch-mtd-concat-part.gz"
Content-Transfer-Encoding: BASE64
Content-ID: <Pine.LNX.4.21.0202121940171.25544@dagobert.svc.sysgo.de>
Content-Description: 
Content-Disposition: attachment; filename="patch-mtd-concat-part.gz"

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
/gIDRg8kIzo7/gfDFTnEoSAAAA==
--380371457-306683353-1013539217=:25544--
