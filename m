Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DaZgM-0001RR-GV
	for linux-mtd@lists.infradead.org; Tue, 24 May 2005 09:42:57 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Kluba Patrik <pajko@kukac.halom.u-szeged.hu>
In-Reply-To: <Pine.LNX.4.61.0505230933320.25999@kukac.halom.u-szeged.hu>
References: <Pine.LNX.4.61.0505230933320.25999@kukac.halom.u-szeged.hu>
Content-Type: text/plain
Date: Tue, 24 May 2005 15:42:40 +0200
Message-Id: <1116942160.6736.201.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "Artem B. Bityuckiy" <dedekind@yandex.ru>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH][02/03] nandsim default values in Kconfig
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Patrik,

On Mon, 2005-05-23 at 09:40 +0200, Kluba Patrik wrote:
> Nandsim uses several module parameters for specifying what chip to simulate. 
> Some default values are in the source itself. It's much convenient to have them 
> in Kconfig so you don't need to specify module parameters every time you load 
> it.

I'm not too happy to add two dozen config options for a driver which is
used for development and research only. 

If you want to experiment with various chip types, parameters... it
makes not much sense to me to compile the settings into the module. 

I'd prefer to have them available as module parameters, so I can change
the settings without recompiling on module load.

> With this patch you can easily construct a NAND geometry for nandsim from within 
> Kconfig. The main purpose is to make testing on large page chips possible on 
> low-memory systems like mine (eg. test on a 256Mbit chip with large pages) or 

Can be solved by module parameters too. You even can use the id of e.g.
a 16GiB chip. Simply limit the max. memory allocation for that chip and
declare all blocks which exceed the available memory as bad blocks so
nothing will ever access them. You can also use partitions for that
purpose.

> test on a chip you do not have and don't know the ID values for it 

If you do not have chip ID's handy, then simply supply the device size,
page size, buswidth and let nandsim scan the id table for a matching
chip. 

To create a new chip id with handcrafted parameters you can even change
a table entry from nandsim.

As I said yesterday I prefer to have such things nicely hidden in the
nandsim module which should have sane default values for the module so
the average Joe User does not run into trouble.

Having those config switches around provokes wrong assumptions about the
real world usage of the nand driver subsystem. It's scary enough to
imagine them, I dont want to read them :)

tglx
