Received: from proxy.force.de ([158.116.254.130])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18En9Y-0006kE-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Nov 2002 08:57:40 +0000
Received: from ex-deu-munich02.force.de (ex-deu-munich02.force.de [10.254.2.10])
	by proxy.force.de (8.11.4/8.11.4) with ESMTP id gAL9SI207793
	for <linux-mtd@lists.infradead.org>; Thu, 21 Nov 2002 10:28:19 +0100 (MET)
Message-ID: <9CFB9DA5261CD611A29B00508B789048380A66@ex-deu-munich02.force.de>
From: "Gettert, Wolfram" <Wolfram.Gettert@fci.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Cannot unload cfi_cmdset_0001 module
Date: Thu, 21 Nov 2002 10:28:23 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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

Hallo,
I cannot unload the cfi_cmdset_0001 module because the use count is not
decreased.
The us counter is increased in=20
static struct mtd_info *cfi_intelext_setup(struct map_info *map)
but there is no place in the module where the use counter is decreased. =
I am
using the module
with a map module derived from physmap.c where I do jedec_probe. Is =
this a
wanted behaviour?

Wolfram

--
Wolfram Gettert
Software Engineer=20
Force Computers GmbH
- A Solectron Company -
Lilienthalstr. 15=20
D-85579 Neubiberg/M=FCnchen
Wolfram.Gettert_at_fci.com
www.forcecomputers.com
