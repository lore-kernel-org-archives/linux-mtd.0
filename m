Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xm8f9-0003RA-92
 for linux-mtd@lists.infradead.org; Wed, 05 Nov 2014 22:02:48 +0000
Message-ID: <545A9E6E.3000208@nod.at>
Date: Wed, 05 Nov 2014 23:02:22 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
Subject: The future of ubi_assert()
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem,

I'm not happy with ubi_assert().
Currently it only prints a warning and a stack trace but execution
continues. In production nobody will notice and while developing turning
it into a plain BUG_ON is most of the time more useful because execution stops
exactly where the boo boo happens one can analyze stack/registers.

I propose splitting ubi_assert() into two new functions.

1. ubi_bug_on()
Basically a BUG_ON(), it shall be used for assertions where execution of
UBI cannot proceed and anything we can do is crashing the machine.

2. ubi_warn_on()
This macro shall be used for assertions where further execution is possible
in read-only mode. ubi_warn_on() would be a WARN_ON() plus ubi_ro_mode().

I'm sure that the vast majority of all ubi_asserts() can be turned into a ubi_warn_on().

What do you think?

Thanks,
//richard
