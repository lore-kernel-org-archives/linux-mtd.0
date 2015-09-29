Received: from r00tworld.com ([212.85.137.150])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zh2dk-0001Z2-Qr
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2015 21:40:49 +0000
From: "PaX Team" <pageexec@freemail.hu>
To: Brian Norris <computersforpeace@gmail.com>
Date: Tue, 29 Sep 2015 23:37:12 +0200
MIME-Version: 1.0
Subject: Re: question about potential integer truncation in default_erasesize
Reply-to: pageexec@freemail.hu
CC: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 re.emese@gmail.com, spender@grsecurity.net
Message-ID: <560B0488.11797.62EBCB6B@pageexec.freemail.hu>
In-reply-to: <20150929210254.GR31505@google.com>
References: <56069B10.450.51AFEC35@pageexec.freemail.hu>,
 <560AFAF9.12740.62C6764A@pageexec.freemail.hu>,
 <20150929210254.GR31505@google.com>
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 29 Sep 2015 at 14:02, Brian Norris wrote:

> > that'd
> > actually be fine for us since it means when the overflow plugin instruments
> > this code any runtime trigger means a real problem, not a false positive.
> 
> OK, good. As long as you aren't going to start complaining about
> theoretical concerns we're OK, but a dynamic check is cool.

we don't care about theoretical bugs but real ones too. the reason for asking 
about this code is that while investigating a false positive report in some
other code (that turned out to be due to a limitation in how gcc represents
certain constructs at its gimple layer) we decided to check the underlying
cause in the whole tree so that we could decide how to fix the FP. the choice
is usually either changing the source code (so that gcc produces a different
representation) or disabling instrumentation for either the particular
expression or all similar constructs. the decision comes down to how many
potentially useful checks we'd omit vs. how many more false positives we'd
risk having. in this case the code construct was copying between structure
fields of different sizes and linux has fortunately a few of these only that
can be manually verified, save for a few cases i could not decide myself, hence
this email and few others elsewhere (some turned out to be real bugs or just
inefficient code in fact).

in short, if you ever hear from us again it'll be because there was a real
integer truncation/overflow/etc event (and we'll have precise source location
for it ;).
