Received: from [85.183.114.52] (helo=Dublin.logfs.org)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RIn8S-0004wC-Kq
	for linux-mtd@lists.infradead.org; Tue, 25 Oct 2011 19:58:09 +0000
Date: Tue, 25 Oct 2011 21:58:58 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: "Fache, Herve" <h-fache@ti.com>
Subject: Re: [PATCH] phram: make kernel boot command line arguments work
Message-ID: <20111025195858.GA10899@logfs.org>
References: <1318866038-11781-1-git-send-email-h-fache@ti.com>
	<1319127421.20953.5.camel@sauron>
	<CA+Xn3W3iUxumMqBELbah_uScMza-jAwMFuXewWdnJOs2sPkZow@mail.gmail.com>
	<1319528259.14178.3.camel@golum>
	<CA+Xn3W0p9k4=wTzonAr_yH+y4JDHoAnM5ZbqHR3xgT=wwMhwAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+Xn3W0p9k4=wTzonAr_yH+y4JDHoAnM5ZbqHR3xgT=wwMhwAw@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, joern@lazybastard.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 25 October 2011 11:09:02 +0200, Fache, Herve wrote:
> On Tue, Oct 25, 2011 at 09:37, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > Yeah, I thought checkpatch.pl would blame you for improper comments
> > style. The standard way to write comments is described in
> > Documentation/CodingStyle.
> 
> I have to admit I just re-used the original patch's comments. Do they
> need to be changed prior to merging?

Nah!  Your patch is a clear improvement.  If the worst offence of your
patch is that you moved code around that had an undesired (but still
quite common) comment style, you are in good shape. ;)

Jörn

-- 
Everything should be made as simple as possible, but not simpler.
-- Albert Einstein
