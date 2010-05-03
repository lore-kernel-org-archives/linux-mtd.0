Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O8uXj-0004My-1R
	for linux-mtd@lists.infradead.org; Mon, 03 May 2010 12:14:35 +0000
Subject: Re: Can not mount UBIFS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?UTF-8?Q?=E6=9E=97=E4=BA=8E=E5=B3=BB?= <okpalin@gmail.com>
In-Reply-To: <r2va145ef951005030454ud5400ebao9ce886d0e86c7549@mail.gmail.com>
References: <a145ef951003110433k5fd6c3c0h23bbe73fdb39686f@mail.gmail.com>
	<531B6536C9F737458807DF75064873C8BE5EB0382D@mta-digimail.MTA.INT>
	<a145ef951003160113x7baea205i8deb13c14ba8e0de@mail.gmail.com>
	<1270544458.6754.15.camel@localhost>
	<r2va145ef951005030454ud5400ebao9ce886d0e86c7549@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 03 May 2010 15:08:32 +0300
Message-ID: <1272888512.27729.46.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Bosi Daniele <Daniele.Bosi@mta.it>,
	GUIDA Nicola <Nicola.GUIDA@numonyx.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-05-03 at 19:54 +0800, 林于峻 wrote:
> Dear all,
> 
> Thank you for your support.
> I can mount UBIFS now after fixing mtd read function.
> 
> However, if I enable the "extra checks" of UBI and UBIFS, then I can
> not mount UBIFS.
> What's the different after enable "extra checks" of UBI and UBIFS.

Well, these are various self-checks. There are many of them and they are
different. E.g., in UBI some of them read flash before every writing and
make sure the area contains all 0xFF bytes. In UBIFS this can be walking
through the whole index tree and checks it. There are many of them and
they are different.

If things stop working for you when you enable all checks, this either
means a bug in the debugging code or a real problem. Please, post your
error report. Use this guide:

http://www.linux-mtd.infradead.org/doc/ubifs.html#L_how_send_bugreport

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
