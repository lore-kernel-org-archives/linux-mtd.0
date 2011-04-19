Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCBsv-0005r2-Np
	for linux-mtd@lists.infradead.org; Tue, 19 Apr 2011 14:26:34 +0000
Received: by gyh20 with SMTP id 20so1983749gyh.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 19 Apr 2011 07:26:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <971bada1c870aa0baf6e8d07784f95e31bb98213.1303202005.git.ext-andriy.shevchenko@nokia.com>
References: <1303195429.2779.2.camel@localhost>
	<971bada1c870aa0baf6e8d07784f95e31bb98213.1303202005.git.ext-andriy.shevchenko@nokia.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Tue, 19 Apr 2011 10:26:11 -0400
Message-ID: <BANLkTi=LuXGaRdiaKRz0RYb1Z3WWaT53ng@mail.gmail.com>
Subject: Re: [PATCHv3 1/3] mkfs.jffs2: fix casting of __off64_t
To: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

T24gVHVlLCBBcHIgMTksIDIwMTEgYXQgMDQ6MzQsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToKPiAt
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IHByaW50ZigiXHRzICUwNG8gJTlsdSDCoCDCoCDCoCDCoCDCoCDCoCAlNWQ6JS0zZCAlc1xuIiwK
PiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIHByaW50ZigiXHRzICUwNG8gJSIgUFJJdTY0ICIgwqAgwqAgwqAgwqAgwqAgwqAgJTVkOiUt
M2QgJXNcbiIsCgppcyB0aGVyZSBhIHJlYXNvbiBmb3IgZHJvcHBpbmcgdGhlIGZpZWxkIHdpZHRo
ID8gIHByaW50ZigiJTkiUFJJdTY0IgouLi4uLiIpIHNob3VsZCB3b3JrIGZpbmUgLi4uCi1taWtl
Cg==
