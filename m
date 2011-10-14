Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1REhLk-0004o3-C7
	for linux-mtd@lists.infradead.org; Fri, 14 Oct 2011 12:58:56 +0000
Received: by wwg9 with SMTP id 9so761200wwg.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 14 Oct 2011 05:58:54 -0700 (PDT)
Subject: RE: ubi vol_size and lots of bad blocks
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Atlant Schmidt <aschmidt@dekaresearch.com>
Date: Fri, 14 Oct 2011 15:58:25 +0300
In-Reply-To: <0A40042D85E7C84DB443060EC44B3FD33001C1D733@dekaexchange07.deka.local>
References: <CAMLZHHSW9daPS9RsMyBnhTfzUQLC0+e9_-=xqiWE4T6upbcaiQ@mail.gmail.com>
	<0A40042D85E7C84DB443060EC44B3FD33001C1D733@dekaexchange07.deka.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1318597112.12351.123.camel@sauron>
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	'Daniel Drake' <dsd@laptop.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-10-11 at 07:35 -0400, Atlant Schmidt wrote:
> 
>   Be careful here -- the last time I looked, blocks that go
>   bad *ARE NOT* actually permanently marked as bad; they may
>   no longer be used during the current boot, but the next time
>   you reboot, they're eligible for attempted-but-often-failing
>   use once again.

If this happened to you, this must be because of a bug in your MTD
driver. UBI dimply calls MTD mark_bad() function to mark blocks bad.

-- 
Best Regards,
Artem Bityutskiy
