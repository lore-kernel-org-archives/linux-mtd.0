Received: from mail-oa0-f41.google.com ([209.85.219.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WV0L9-0004U3-C6
 for linux-mtd@lists.infradead.org; Tue, 01 Apr 2014 15:11:03 +0000
Received: by mail-oa0-f41.google.com with SMTP id j17so11267671oag.14
 for <linux-mtd@lists.infradead.org>; Tue, 01 Apr 2014 08:10:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CALnQHM3r9DDqjmo=s1aFLgob+ztzfqjVrGbOS9QWGLKB+nv=fQ@mail.gmail.com>
References: <1395875121-9320-1-git-send-email-davidm@egauge.net>
 <20980858CB6D3A4BAE95CA194937D5E73EAB5F84@DBDE04.ent.ti.com>
 <CALnQHM3Yn01qJdpHaqhA3Z+onVeaROTF0esv7S-ctY3y7dgNjw@mail.gmail.com>
 <20140401083644.GG6400@brian-ubuntu>
 <CALnQHM3r9DDqjmo=s1aFLgob+ztzfqjVrGbOS9QWGLKB+nv=fQ@mail.gmail.com>
Date: Tue, 1 Apr 2014 09:10:41 -0600
Message-ID: <CALnQHM17jn3=VWYtb8cok_Sydh6ShUmoFdEOPF9Z7sFyUHXKBA@mail.gmail.com>
Subject: Fwd: [PATCH] mtd: nand: Add support for Micron on-die ECC controller
 (rev2).
From: David Mosberger <davidm@egauge.net>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[Forward as plain text.  Thanks, Gmail...]

---------- Forwarded message ----------
From: David Mosberger <davidm@egauge.net>
Date: Tue, Apr 1, 2014 at 9:09 AM
Subject: Re: [PATCH] mtd: nand: Add support for Micron on-die ECC
controller (rev2).
To: Brian Norris <computersforpeace@gmail.com>
Cc: "Gupta, Pekon" <pekon@ti.com>, "dedekind1@gmail.com"
<dedekind1@gmail.com>, "linux-mtd@lists.infradead.org"
<linux-mtd@lists.infradead.org>, Gerhard Sittig <gsi@denx.de>


On Tue, Apr 1, 2014 at 2:36 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
>
>
> But for this case, the max_bitflips count is used for determining when
> the error rate is unacceptably high, not just to see whether your data
> is currently corrupt. So if extra bitflips in this (otherwise
> unimportant) spare area might eventually cause the ECC hardware to
> report an error, then we need to count them.
>

To do this properly would require describing which OOB bytes are
included in the ECC.
I don't think that's possible with the current nand_ecclayout, no?

Also, effectively what my patch does is to make those OOB bytes not
ECC protected, which
is perfectly fine semantics as far as Linux is concerned.  So yes,
what you say would be
an improvement, but it's not strictly needed.

  --david
-- 
eGauge Systems LLC, http://egauge.net/, 1.877-EGAUGE1, fax 720.545.9768



-- 
eGauge Systems LLC, http://egauge.net/, 1.877-EGAUGE1, fax 720.545.9768
