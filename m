Received: from dsl-64-130-201-237.telocity.com ([64.130.201.237] helo=dual166.onz.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cfCj-0003ln-00
	for <linux-mtd@lists.infradead.org>; Thu, 08 Aug 2002 05:47:21 +0100
Reply-To: <acurtis@onz.com>
From: "Allen Curtis" <acurtis@onz.com>
To: "??" <kevin@gv.com.tw>,
	<linux-mtd@lists.infradead.org>
Subject: RE: will jffs2 write to device when doing "read-only" operation like "ls"?
Date: Wed, 7 Aug 2002 21:46:49 -0700
Message-ID: <NCBBIINEHIPFGJPLBEIFMEIDDKAA.acurtis@onz.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <000d01c23e95$4c679060$1b0448c0@gv.com.tw>
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

> will jffs2 write to device when doing "read-only" operation like "ls"?

To my knowledge NO. JFFS and JFFS2 work just fine with read-only devices so
I assume that writing for no reason is not necessary.
