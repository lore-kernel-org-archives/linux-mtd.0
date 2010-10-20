Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P8Wl6-0008EE-I5
	for linux-mtd@lists.infradead.org; Wed, 20 Oct 2010 11:23:05 +0000
Received: by fxm15 with SMTP id 15so2548877fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 20 Oct 2010 04:23:03 -0700 (PDT)
Subject: Re: Expanding UBI fs to maxavailable size
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Karsten Jeppesen <arm9263@yahoo.com>
In-Reply-To: <968604.60195.qm@web120213.mail.ne1.yahoo.com>
References: <4CBCBA9D.4040202@jeppesens.com> <1287465154.1911.2.camel@brekeke>
	<968604.60195.qm@web120213.mail.ne1.yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 20 Oct 2010 14:19:54 +0300
Message-ID: <1287573594.9272.64.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-10-19 at 01:17 -0700, Karsten Jeppesen wrote:
> Hi Artem,
> 
> This is Karsten Jeppesen, just using an out-of-the-house account,
> and thanks for your very quick reply.

UBI and UBIFS always print something, refer:
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_how_send_bugreport
item 3.

Anyway, AFAICS, UBI auto-resize the UBI volume correctly, because of
this:

> ubi0
> Volumes count:                           1
> Logical eraseblock size:                 130944 bytes, 127.9 KiB
> Total amount of logical eraseblocks:     486 (63638784 bytes, 60.7 MiB)

I re-sized.

However, UBIFS file-system did not re-size, because you specified too
small maximum UBIFS LEB count: --max-leb-cnt=232

Try --max-leb-cnt=511 and it should work. Take a look here:
http://www.linux-mtd.infradead.org/faq/ubifs.html#L_max_leb_cnt

I agree this all stuff is not as user-friendly as it could, but you have
a good chance to make it user-friendlier by contributing docs or code.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
