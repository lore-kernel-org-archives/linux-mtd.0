Received: from dsl-64-130-201-237.telocity.com ([64.130.201.237] helo=dual166.onz.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17mcRC-0001oK-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2002 16:51:26 +0100
Reply-To: <acurtis@onz.com>
From: "Allen Curtis" <acurtis@onz.com>
To: "Jasmine Strong" <jasmine@hex.linuxgrrls.org>,
	"David Woodhouse" <dwmw2@infradead.org>
Cc: "John Hall" <John.Hall@optionexist.co.uk>,
	"Linux MTD list \(E-mail\)" <linux-mtd@lists.infradead.org>
Subject: RE: Stable cvs version for 2.4 
Date: Wed, 4 Sep 2002 08:50:27 -0700
Message-ID: <NCBBIINEHIPFGJPLBEIFIEKODLAA.acurtis@onz.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.33.0209041629310.22657-100000@hex.linuxgrrls.org>
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

> Yep.  I agree wholeheartedly.  I would be happiest with having
> compile-time options for the three different methods-  on many
> architectures writing a byte is much slower than writing a word, so on
> those architectures it may be better to use an int (the current method).
> On other architectures addresses are word aligned and one may abuse the
> pointers with impunity (David's suggested method), and on others pointers
> aren't always aligned and a byte write is nice and fast (the method using
> a flags byte.)

Just pick a method that will work for all. No sense in cluttering the code
with conditional compile stuff because we can not choose an implementation.
How about we make the flags element either a byte or a word depending on
architecture. This would only result in a structure redefinition and not
affect the rest of the code.
