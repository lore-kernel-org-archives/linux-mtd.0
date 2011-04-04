Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q6ffY-0000Me-B6
	for linux-mtd@lists.infradead.org; Mon, 04 Apr 2011 09:01:57 +0000
Received: by wyb28 with SMTP id 28so5421627wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 04 Apr 2011 02:01:54 -0700 (PDT)
Subject: Re: UBIFS question, atomic file create/rename semantics
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jon Povey <Jon.Povey@racelogic.co.uk>
In-Reply-To: <70E876B0EA86DD4BAF101844BC814DFE093FAFC247@Cloud.RL.local>
References: <70E876B0EA86DD4BAF101844BC814DFE093FAFC247@Cloud.RL.local>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 04 Apr 2011 11:59:24 +0300
Message-ID: <1301907564.2760.44.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Mon, 2011-04-04 at 09:54 +0100, Jon Povey wrote:
> I have a file I want to create on first-time boot on my system,
> on UBIFS. It's done in a shell script, and the logic is something like
> 
> if [ ! -e $FILE ]
> then
>         # create the file
> fi
> 
> Once or twice this file has turned out to be zero length (or possibly
> contain nulls, I am working on slightly vauge reports).
> 
> Looking into the issues of sync and semantics, I think this is related
> to not doing sync and rename.
> The script was pretty much just saying "prog > $FILE" and no sync.
> 
> I came up with the following and would appreciate any comments about
> how reliable this should be:
> 
> if [ ! -e $FILE ]
> then
>         prog > $FILE.tmp
>         sync
>         mv $FILE.tmp $FILE
>         sync
> fi
> 
> My understanding is that as the .tmp file is on the same filesystem
> and I ran sync, the mv means the final file atomically either exists
> with full correct contents, or will not exist at all (after surprise
> power cycle during the process).
> 
> A quick "yes, fine" or "won't work" would be appreciated.

It does not mean you should trust me and not test that, but I think
"yes", your sequence should make it.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
