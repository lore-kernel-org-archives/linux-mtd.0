Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QaAoM-0000wO-8b
	for linux-mtd@lists.infradead.org; Fri, 24 Jun 2011 18:08:58 +0000
Received: by wwf22 with SMTP id 22so2196977wwf.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Jun 2011 11:08:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1308938594-20486-2-git-send-email-computersforpeace@gmail.com>
References: <1308938594-20486-1-git-send-email-computersforpeace@gmail.com>
	<1308938594-20486-2-git-send-email-computersforpeace@gmail.com>
Date: Fri, 24 Jun 2011 11:08:54 -0700
Message-ID: <BANLkTi=aOniZ2FYom=_Nte0dmKu7MxUYXg@mail.gmail.com>
Subject: Re: [PATCH 1/6] nanddump: kill --omitbad, --noskipbad
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Woodhouse <dwmw2@infradead.org>,
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 24, 2011 at 11:03 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> As mentioned previously, we are killing --omitbad in favor of the new
> --bb=skipbad option, which functions fairly similarly. Also, --noskipbad
> has become --bb=noskipbad, so remove the old `-N' and `--noskipbad' flags.

Oops, I meant `--bb=dumpbad', not `--bb=noskipbad'. I'll resend if you
need me to change the commit msg...
