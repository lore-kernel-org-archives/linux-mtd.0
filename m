Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1ITWZI-0006Mw-V6
	for linux-mtd@lists.infradead.org; Fri, 07 Sep 2007 01:39:51 -0400
Subject: Re: [PATCH] [MTD] NAND: Prevents NAND subsystem from hogging the CPU.
From: Artem Bityutskiy <dedekind@infradead.org>
To: rick@efn.org
In-Reply-To: <E1ITLkE-0002LI-00@amazonia.comcast.net>
References: <E1ITLkE-0002LI-00@amazonia.comcast.net>
Content-Type: text/plain; charset=utf-8
Date: Fri, 07 Sep 2007 08:39:38 +0300
Message-Id: <1189143578.14370.66.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-09-06 at 11:06 -0700, Rick Bronson wrote:
>                 if (chip->dev_ready(mtd))
>                         break;
>                 touch_softlockup_watchdog();
> +               cond_resched();  /* let others run */
>         } while (time_before(jiffies, timeo));
>         led_trigger_event(nand_led_trigger, LED_OFF);
>  }

And I think this touch_softlockup_watchdog() is bogus.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
