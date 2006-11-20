Received: from ada.info.unlp.edu.ar ([163.10.5.66])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GmF2o-0000WB-31
	for linux-mtd@lists.infradead.org; Mon, 20 Nov 2006 14:43:13 -0500
Received: from www-data by ada.info.unlp.edu.ar with local (Exim 4.50)
	id 1GmF2T-0002Fc-HC
	for linux-mtd@lists.infradead.org; Mon, 20 Nov 2006 16:42:45 -0300
Message-ID: <20061120164245.hmcfrgcbcc0kwk4w@ada.info.unlp.edu.ar>
Date: Mon, 20 Nov 2006 16:42:45 -0300
From: =?iso-8859-1?b?TWF07WFzIA==?= =?iso-8859-1?b?WmFiYWxq4XVyZWd1aQ==?=
	<matiasz@info.unlp.edu.ar>
To: linux-mtd@lists.infradead.org
Subject: Re: compression tests in jffs2
References: <20061117190637.2fgiinwlz4wswso0@ada.info.unlp.edu.ar>
	<1163853879.5597.54.camel@sauron>
	<20061118133527.8kxy5bxog0084w88@ada.info.unlp.edu.ar>
	<1163889770.20835.6.camel@zod.rchland.ibm.com>
In-Reply-To: <1163889770.20835.6.camel@zod.rchland.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset=ISO-8859-1;
	DelSp="Yes";
	format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

yes, I know... thank you for the advice.

In compr.c file, I can see some "stats" and "compression-mode" getters =20
and setters, between  CONFIG_JFFS2_PROC  #ifdef and #endif... Do you =20
think it is posible to reuse this code for implementing a sysfs =20
interface?


----------------------------------------------------------------------------=
------
Mat=EDas Zabalj=E1uregui
http://linux.linti.unlp.edu.ar



Quoting Josh Boyer <jwboyer@linux.vnet.ibm.com>:

> On Sat, 2006-11-18 at 13:35 -0300, Mat=EDas Zabalj=E1uregui wrote:
>> OK! Thank you for your answer
>>
>> >
>> >> - recompiling the jffs2 module is the only way to reconfigure the
>> >> compression behaviour?
>> >
>> > Yes at the moment. But adding dynamic and per-file compression so would
>> > cool.
>> >
>>
>> Do you think a /proc entry is a suitable mecanism for runtime
>> compression configuration?
>
> Please avoid /proc for anything.  The compression type has nothing to do
> with processes, so it doesn't belong in /proc.
>
> I would suggest either using a mount option if you want to make the
> whole filesystem use a particular type of compression, or use xattrs to
> specify compression type on a per file basis.  A third option would be
> to use a sysfs entry similar to how you would use /proc.
>
> josh
>
>
>



----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.
