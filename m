Received: from mail-bw0-f12.google.com ([209.85.218.12])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LDP6K-0002K0-Kq
	for linux-mtd@lists.infradead.org; Thu, 18 Dec 2008 20:04:05 +0000
Received: by bwz5 with SMTP id 5so1271144bwz.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 18 Dec 2008 12:04:02 -0800 (PST)
Message-ID: <71cd59b00812181200n20b31037qc0d6ab8c2fda3114@mail.gmail.com>
Date: Thu, 18 Dec 2008 21:00:51 +0100
From: "Corentin Chary" <chary_c@epitech.net>
Sender: corentin.chary@gmail.com
To: "Josh Boyer" <jwboyer@gmail.com>
Subject: Re: [PATCH 1/2] Makefile export shared libraries
In-Reply-To: <20081218191235.GD18201@yoda.jdub.homelinux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <52e42efe0812180616q28c10c72nae087e214c014676@mail.gmail.com>
	<20081218191235.GD18201@yoda.jdub.homelinux.org>
Cc: Sidney Amani <amani_s@epitech.net>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 18, 2008 at 8:12 PM, Josh Boyer <jwboyer@gmail.com> wrote:
>
> I don't see where you actually create a shared library here.  There
> is no soname set, for example.  I'm not opposed to creating shared
> libraries, but it should be done properly so that if the API/ABI
> changes then we can bump the soname, etc.

The rules  which create the .so are:

shared: $(addsuffix .so, $(LIBS))
%.pic.o: %.c
      $(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $< -c -o $@
%.so: %.pic.o
      $(CC) $(LDFLAGS) -shared -o $@ $^

We forgot to add -Wl,-soname,foo .
Is there anything else ?
If it's ok we will re-send the patch tomorow.



-- 
Corentin Chary
http://xf.iksaif.net
