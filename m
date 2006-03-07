Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FGZzi-0001y8-8Y
	for linux-mtd@lists.infradead.org; Tue, 07 Mar 2006 06:04:57 -0500
Message-ID: <440D68CA.7090002@inf.u-szeged.hu>
Date: Tue, 07 Mar 2006 12:04:42 +0100
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
References: <43FAEFD6.1090308@inf.u-szeged.hu> <440C7D45.9080406@yandex.ru>
In-Reply-To: <440C7D45.9080406@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: A simple JFFS3 GC algorithm
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

> Your proposal is based on a "map" which is basically a per-region
> table. This is unscalable solution. Do you have any other more
> scalable proposals? Let's for now consider this as a fall-back
> solution, OK?

If we don't work with regions smaller than 256K, than a size of the map
of a 16G flash is about 786K, which I think is still OK, and also can be
cached.

I know this is not the best solution, we suggested it only for the first
variant of JFFS3 because it may work well on recent flash chips and make
the garbage collection absolutelly transparent, and relatively easy to
implement - there is no serious locking problems.

> And, BTW, how are you going to build this "map" when you mount the
> file system? 

It is stored on the flash somewhere (its position is in the superblock),
and the changes are logged into a separated journal. When this journal
is fulled, the new version of map will be written out. If the file
system is mounted the stored map will be loaded and the events stored in
the journal are replayed.

Anyway, we don't insist on this algorithm, it was only an idea, maybe
not usefull. We've started to implement a simplified user space
prototype of JFFS3, specially for testing different kind of garbage
collecting methods.

Bye,
Ferenc
