Received: from anchor-post-33.mail.demon.net ([194.217.242.91])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CUUAx-0008HH-CT
	for linux-mtd@lists.infradead.org; Wed, 17 Nov 2004 13:05:05 -0500
Content-Type: text/plain;
  charset="iso-8859-1"
From: Simon Haynes <simon@baydel.com>
To: Estelle HAMMACHE <estelle.hammache@st.com>,
	"Artem B. Bityuckiy" <dedekind@infradead.org>
Date: Wed, 17 Nov 2004 18:02:05 +0000
References: <6BEF91EC1C3A@baydel.com> <419B8EFF.17DCE55B@st.com>
In-Reply-To: <419B8EFF.17DCE55B@st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <6C6262B2548F@baydel.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: oops line 231 of latest readinode.c
Reply-To: simon@baydel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This crash happened on one of several systems which I have been running for 
over a year. This crash came out of the blue when the system was updating a 
logfile with a message. It has performed many writes during this time and I 
have never seen this problem before. As far as trying to reproduce the 
problem is concerned. 
Some time ago I used a program to exercise the flash to try and track other 
problems and as I said before I have never seen this oops before. Besides 
performing more flash exercising tests I would not have a clue how I could 
reproduce this. 

So in summary this crash was out of the blue and I suspect that I can not 
easily reproduce it without understanding more about what happened.

Cheers

Simon.

On Wednesday 17 Nov 2004 5:48 pm, Estelle HAMMACHE wrote:
> Simon Haynes wrote:
> > newfrag->ofs)' and then in the next if as newfrag->ofs contains -1. The
> > oops
>
> It seems very strange that newfrag->ofs contains -1. If you can reproduce
> it could you check where it was filled with this strange value ?
>
> Estelle
