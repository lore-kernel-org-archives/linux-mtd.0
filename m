Received: from wproxy.gmail.com ([64.233.184.202])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FGi8r-0000pI-5n
	for linux-mtd@lists.infradead.org; Tue, 07 Mar 2006 14:46:52 -0500
Received: by wproxy.gmail.com with SMTP id i23so8764wra
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Mar 2006 11:46:43 -0800 (PST)
Message-ID: <625fc13d0603071146n32101127id68056c6a52f96c2@mail.gmail.com>
Date: Tue, 7 Mar 2006 13:46:42 -0600
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Lakshmi N. Sundararajan" <lakshmi.s@promise.com>
In-Reply-To: <B70A50D07063384EB9BCE3330D18414F024CCCE5@nonameb.ptu.promise.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <B70A50D07063384EB9BCE3330D18414F024CCCE5@nonameb.ptu.promise.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Questions.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 3/7/06, Lakshmi N. Sundararajan <lakshmi.s@promise.com> wrote:
> Hello Team:
> I have a basic question on the definition of a variable in use.
>
> What is the definition of "bankwidth" on FLASH devices?
> Is it the data bus width in bytes?
> A 16bit data bus would have a bankwidth of 2?
> An 8bit data bus FLASH would have a bankwidth of 1?

Yes, sort of.  The variable used to be called buswidth, however there
can be configurations where the bank is not fully addressable in the
buswidth.  So the bankwidth variable represents how you can access all
of the chips.

"Normal" boards will use bankwidth exactly as you described above.  See:

http://lists.infradead.org/pipermail/linux-mtd/2004-July/009974.html

and

http://lists.infradead.org/pipermail/linux-mtd/2004-July/009986.html

for more info.

josh
