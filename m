Received: from w228.z208176144.sjc-ca.dsl.cnc.net ([208.176.144.228]
	helo=ns1.pwrseries.com)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EP7ls-0003V1-G4
	for linux-mtd@lists.infradead.org; Mon, 10 Oct 2005 20:13:38 -0400
Received: from jmd (w238.z208176144.sjc-ca.dsl.cnc.net [208.176.144.238])
	(authenticated bits=0)
	by ns1.pwrseries.com (8.12.8/8.12.8) with ESMTP id j9ANnij4027756
	(version=TLSv1/SSLv3 cipher=DES-CBC3-SHA bits=168 verify=NO)
	for <linux-mtd@lists.infradead.org>; Mon, 10 Oct 2005 16:49:44 -0700
From: "Joseph M Dupre (AVAB Inc.)" <dupre@avab.com>
To: linux-mtd@lists.infradead.org
Date: Mon, 10 Oct 2005 17:13:26 -0700
MIME-Version: 1.0
Message-ID: <434AA136.376.1BAE532@localhost>
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Subject: docboot: requirements for build?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Is it necessary to 'make' the docboot doc_spl image on the target 
system itself?

I have cross compiled the mtd/util tools for the target so I can copy 
the doc_spl image to the target's DOC, but I do not have a means at 
this point to actually 'make' the doc_spl image on the target.

Should it be possible to generate doc_spl on a "host" system that 
does not have mtd or doc kernel drivers enabled?

Thanks,
- Joe 
