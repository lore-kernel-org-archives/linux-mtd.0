Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B7fUs-0002Ws-QC
	for linux-mtd@lists.infradead.org; Sun, 28 Mar 2004 19:59:02 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de
 (iPlanet Messaging Server 5.2 HotFix 1.17 (built Jun 23 2003))
 with SMTP id <0HVA00CSQVECD1@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Sun, 28 Mar 2004 20:59:01 +0200 (MEST)
Date: Sun, 28 Mar 2004 19:55:35 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: linux-mtd@lists.infradead.org
Message-id: <200403282055.35474.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
Content-disposition: inline
Subject: NAND changes
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Charles, David and I had a discussion on IRC today and we 
worked out a scheme to move things forward.

1. The current interface is kept alive due to following reasons:

- Compability with existing filesystems which rely on a fixed oob scheme to 
guarantee the interoperability of existing devices
- Keeping the interface capable to implement filesystems, which have a given 
fixed OOB layout, like NFTL, SmartMedia FAT and the new SmartMedia XD
- Keeping the interface capable to implement filesystems, which must know 
about the OOB placement scheme

2. The existing interface is extended for filesystems, which want to be 
placement agnostic
	
- The nand layer provides a default placement scheme, which is either a 
builtin default for the small and large block chip types or a scheme, which 
is provided by the hardware driver (DOC, boardXYZ)
- The default placement scheme can be overridden by the filesystem driver or 
by the userspace interface

This is not a big rewrite of the code and the API. It's just adding 
functionality around the existing versatile interface to support 
placement-agnostic oob usage. The existing filesystems will be modfied to 
support the current interface for existing implementations. This should be 
done runtime selectable.
For example:
mount -t fs-v1 could support the legacy interface for small page devices only
mount -t fs-v2 could support the new interface for small and large page 
devices.
The modifications which are neccecary to the file system drivers have to be 
discussed seperately.

Functionality added to the interface:
- Function for bad block queries
- Function for bad block marking
- Default placement schemes for small and large page devices 
- Placement scheme support for hardware drivers (e.g. DOC)
- Function to read the placement scheme from the fs driver

Functional changes
- ECC result reporting fixup
- OOB interface support for autoplacement of OOB data

Changes related to the new 1k/2k pages size devices:
- Support for 16 bit buswidth
- Support for the changed command set
- Support for the extended features in Samsung chips (cache program)

We will not support non page aligned writes, as this would cause PITA for ECC 
handling. Filesystems must be aware of this and provide their own mechanisms 
to handle this if neccecary.

I will work active on the implementation.  I'm happy if somebody provides 
help, most important will be testing on real hardware with large page 
devices, as I don't have one.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
