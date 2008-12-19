Received: from yw-out-1718.google.com ([74.125.46.154])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LDjyR-00026C-Do
	for linux-mtd@lists.infradead.org; Fri, 19 Dec 2008 18:21:19 +0000
Received: by yw-out-1718.google.com with SMTP id 5so431131ywm.72
	for <linux-mtd@lists.infradead.org>;
	Fri, 19 Dec 2008 10:21:18 -0800 (PST)
Message-ID: <8bd0f97a0812191021x2be156cbmf46af4bdae6376a7@mail.gmail.com>
Date: Fri, 19 Dec 2008 13:21:18 -0500
From: "Mike Frysinger" <vapier.adi@gmail.com>
To: "Corentin Chary" <chary_c@epitech.net>
Subject: Re: [PATCH 2/2] Makefile export libraries headers
In-Reply-To: <71cd59b00812190129x58a8a26ena7add58ccd461e35@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <52e42efe0812180616u59242b0eucccaccdd5e276f22@mail.gmail.com>
	<8bd0f97a0812181225y56b8c0d9n8b5493e33287e5c6@mail.gmail.com>
	<71cd59b00812190129x58a8a26ena7add58ccd461e35@mail.gmail.com>
Cc: Sidney Amani <amani_s@epitech.net>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 19, 2008 at 04:29, Corentin Chary wrote:
>>> +       for i in $(addsuffix .h, $(LIBS)); do \
>>> +               [ -f include/$$i ] &&  install -m 0755 include/$$i  ${DESTDIR}/${LIBDIR}/; \
>>> +       done
>>
>> you're installing headers into /usr/lib/ ?  that doesnt make any sense ...
>
> /LIBDIR/INCLUDEDIR/s

well that change doesnt make sense either as you changed INCLUDEDIR to
"/include" ... i'm guessing you'll want to revert that too :)
-mike
