Received: from mail1-3.netinsight.se ([212.247.11.2] helo=ernst.netinsight.se)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19m7Ae-0003rQ-01
	for <linux-mtd@lists.infradead.org>; Mon, 11 Aug 2003 08:32:48 +0100
From: Jonas Larsson <jonas.larsson@netinsight.net>
To: linux-mtd@lists.infradead.org
Message-Id: <1060587118.28472.66.camel@doris>
Mime-Version: 1.0
Date: 11 Aug 2003 09:31:59 +0200
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Subject: Cmdline partitions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all. I've had some trouble creating my mtd partitions 
with the 2.6.0-test2 kernel and I need some advice. I have
my own mapping driver for our board (not submitted yet) which
is based on the dc21285 map driver.

In the 2.5.70-rmk1 kernel I call parse_cmdline_partitions with
mtd_id="mymapdriver", and specify mtdparts=mymapdriver:<partitions>
to the kernel. In 2.6.0-test2-rmk1 I have to call parse_mtd_partitions
to parse the cmdline. However I cannot specify my mtd_id from the map
driver (except setting the .name member of my map_info struct) as I
could with 2.5.70. This makes the line

if ((!mtd_id) || (!strcmp(part->mtd_id, mtd_id)))

in cmdlinepart.c:parse_cmdline_partitions() to fail. 

The edb7312 map driver calls parse_mtd_partitions like this: 
mtd_parts_nb = parse_mtd_partitions(mymtd, probes, &mtd_parts,
"edb7312-nor"); 

But the 4th arg (origin) is a unsigned long and as I can see
is not used by the implementation of the function. Is this
really the way it is supposed to be?
      
Comments?

/ Jonas
