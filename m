Date: Fri, 14 Jan 2005 11:07:03 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Steven Scholz <steven.scholz@imc-berlin.de>
In-Reply-To: <41E79DD5.4050601@imc-berlin.de>
Message-ID: <Pine.LNX.4.58.0501141105240.17331@phoenix.infradead.org>
References: <41E4D6E5.1090407@imc-berlin.de> <41E4EDBE.8070302@inf.u-szeged.hu>
	<41E52EAD.2090302@imc-berlin.de>
	<Pine.LNX.4.58.0501121508270.10617@phoenix.infradead.org>
	<41E53F52.3010601@imc-berlin.de>
	<Pine.LNX.4.58.0501121519280.10617@phoenix.infradead.org>
	<41E79DD5.4050601@imc-berlin.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2: checking CRCs twice!?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 14 Jan 2005, Steven Scholz wrote:

> Artem B. Bityuckiy wrote:
> 
> >>>This seems to be true for NOR. But  chrcking CRC helps at least *detect* 
> >>>and *report* media problems.
> >>
> >>Fair enough.
> >>But who will pay attention if the system is embedded into your microwave oven or 
> >>washing maschine... ;-)
> > 
> > In this case this doesn't make sence.
> > But in general it does.
> > 
> > Possibly it makes sence to have this checking as an configuration option.
> 
> So will someone add this config option for JFFS2?
> Or should it be done in SUMMARY patch?
> Are there any plans to include this SUMMARY patch to the JFFS2 CVS?
> Or will it stay seperated?
AFAIK, Summary will go to JFFS3.
I don't know for what Ferenc made "enable/disable summary" configuration 
option, I believe it must be enabled by default.

> 
> --
> Steven
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
