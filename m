Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QOq55-0007JP-Nb
	for linux-mtd@lists.infradead.org; Tue, 24 May 2011 11:47:24 +0000
Received: by ewy3 with SMTP id 3so2427894ewy.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 24 May 2011 04:47:21 -0700 (PDT)
Subject: Re: read_pnode: error -22 reading pnode at XX:YYYYY
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Rick Johnson <rick22@wi.rr.com>
In-Reply-To: <1306226504.2785.68.camel@localhost>
References: <4DADF9E6.9010709@wi.rr.com>
	<1303392001.2757.16.camel@localhost>  <4DC31183.8060807@wi.rr.com>
	<1304706750.7222.95.camel@localhost>  <4DD6DA14.9050402@wi.rr.com>
	<1306226504.2785.68.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 24 May 2011 14:43:02 +0300
Message-ID: <1306237382.2785.96.camel@localhost>
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

On Tue, 2011-05-24 at 11:41 +0300, Artem Bityutskiy wrote:
> 3. Please, enable LPT extra checks and run your tests and try to
>    reproduce this issue. To enable LPT extra checks you need to do:
> 
>    $ sudo sh -c 'echo 32 > /sys/module/ubifs/parameters/debug_chks'
> 
>    This will make UBIFS to check lprops at each commit and we have a
>    better chance to catch issues.

Note, you should not enable other checks or any messages - this will
slow down things. Just enable LPT extra-checks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
