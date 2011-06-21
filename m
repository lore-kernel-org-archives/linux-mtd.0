Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QYoba-0004OX-9g
	for linux-mtd@lists.infradead.org; Tue, 21 Jun 2011 00:14:15 +0000
Received: by fxm14 with SMTP id 14so951068fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 20 Jun 2011 17:14:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <BANLkTikGuHsp8DOO3cBMJERwVAVPVW3-aw@mail.gmail.com>
References: <1307563284-32416-1-git-send-email-computersforpeace@gmail.com>
	<BANLkTi=aU5j9FJ_-bsye6Whh-+PzxrHKCA@mail.gmail.com>
	<BANLkTikGuHsp8DOO3cBMJERwVAVPVW3-aw@mail.gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Mon, 20 Jun 2011 20:13:41 -0400
Message-ID: <BANLkTi=2OjDXX=Bjf=GVMHRhSEpqT+VFdA@mail.gmail.com>
Subject: Re: nanddump badblock options
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jun 20, 2011 at 19:09, Brian Norris wrote:
> Also, I haven't heard any comments on my idea of changing the default
> OOB options, where nanddump should NOT, by default, dump OOB data
> (like nandwrite, which does NOT write OOB by default). I'm thinking we
> could change the default here and add an option to force it to include
> OOB:

i think that makes sense

> This is mostly just a question of what is least confusing to the
> mtd-utils user community; I can adapt to my own code changes!

u-boot changed defaults similar to this and there werent really any
complaints.  i believe nandwrite/nanddump output info by default,
right ?  if we make it explicit what it's doing, people should be
fine.
-mike
