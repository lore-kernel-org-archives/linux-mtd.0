Received: from world.rdmcorp.com ([204.225.180.10] helo=mailhost.rdmcorp.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DAZQy-0004pe-Iv
	for linux-mtd@lists.infradead.org; Sun, 13 Mar 2005 15:11:33 -0500
Received: from [10.1.1.102] (10.1.2.1) by mailhost.rdmcorp.com (Worldmail
	1.3.167) for linux-mtd@lists.infradead.org;
	13 Mar 2005 15:11:30 -0500
Date: Sun, 13 Mar 2005 15:10:16 -0500 (EST)
From: "Robert P. J. Day" <rpjday@mindspring.com>
To: MTD mailing list <linux-mtd@lists.infradead.org>
Message-ID: <Pine.LNX.4.61.0503131506360.1603@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: add support for official SI prefixes in numeric option values
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


  sorry for the delay, but i did promise that i would whip something
up to support the official SI suffixes as defined at:

http://physics.nist.gov/cuu/Units/binary.html

  rather than using atoi() or strtol() for parsing, use the following
routine (obviously, this is pretty simplified -- extra processing or
error-checking can be added easily):

////////////////////////////////////////////////////////
//
//  Parse unsigned integer, supporting SI suffixes.
//
//  Suffixes recognized:
//
//	[kK]i:	1 kilo
//	[mM]i:	1 mega
//	[gG]i:	1 giga
//
////////////////////////////////////////////////////////

unsigned long int
atouli(const char *nptr)
{
	unsigned long uli = 0 ;

	char *suffixptr ;

	uli = strtoul(nptr, &suffixptr, 0) ;

	if (!strcmp(suffixptr, "ki") || !strcmp(suffixptr, "Ki"))
		uli *= 1024 ;
	else if (!strcmp(suffixptr, "mi") || !strcmp(suffixptr, "Mi"))
		uli *= (1024 * 1024) ;
	else if (!strcmp(suffixptr, "gi") || !strcmp(suffixptr, "Gi"))
		uli *= (1024 * 1024 * 1024) ;

	return uli ;
}
