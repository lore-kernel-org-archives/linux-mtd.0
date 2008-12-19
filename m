Received: from mail-bw0-f12.google.com ([209.85.218.12])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LDlGq-00023d-El
	for linux-mtd@lists.infradead.org; Fri, 19 Dec 2008 19:44:25 +0000
Received: by bwz5 with SMTP id 5so2345002bwz.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 19 Dec 2008 11:44:23 -0800 (PST)
Message-ID: <71cd59b00812191142vb3b9981gebcc3689c54bdae5@mail.gmail.com>
Date: Fri, 19 Dec 2008 20:42:57 +0100
From: "Corentin Chary" <corentin.chary@gmail.com>
To: "Mike Frysinger" <vapier.adi@gmail.com>
Subject: Re: [PATCH 2/2] Makefile export libraries headers
In-Reply-To: <8bd0f97a0812191021x2be156cbmf46af4bdae6376a7@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <52e42efe0812180616u59242b0eucccaccdd5e276f22@mail.gmail.com>
	<8bd0f97a0812181225y56b8c0d9n8b5493e33287e5c6@mail.gmail.com>
	<71cd59b00812190129x58a8a26ena7add58ccd461e35@mail.gmail.com>
	<8bd0f97a0812191021x2be156cbmf46af4bdae6376a7@mail.gmail.com>
Cc: Sidney Amani <amani_s@epitech.net>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 19, 2008 at 7:21 PM, Mike Frysinger <vapier.adi@gmail.com> wrote:
> On Fri, Dec 19, 2008 at 04:29, Corentin Chary wrote:
>>>> +       for i in $(addsuffix .h, $(LIBS)); do \
>>>> +               [ -f include/$$i ] &&  install -m 0755 include/$$i  ${DESTDIR}/${LIBDIR}/; \
>>>> +       done
>>>
>>> you're installing headers into /usr/lib/ ?  that doesnt make any sense ...
>>
>> /LIBDIR/INCLUDEDIR/s
>
> well that change doesnt make sense either as you changed INCLUDEDIR to
> "/include" ... i'm guessing you'll want to revert that too :)
> -mike
>

with DESTDIR=/usr/local -> /usr/local/include
with DESTDIR=/usr -> /usr/include

So it seems ok to me.

-- 
Corentin Chary
http://xf.iksaif.net
