Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q8sSP-0000J4-V2
	for linux-mtd@lists.infradead.org; Sun, 10 Apr 2011 11:05:30 +0000
Received: by iwn36 with SMTP id 36so5561209iwn.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 10 Apr 2011 04:05:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <BANLkTi=_yZXkdodpjHgp5=mowWwK-fTTgA@mail.gmail.com>
References: <1302188641-30514-1-git-send-email-fransmeulenbroeks@gmail.com>
	<BANLkTik9BcPTkgb_AwtmG6TPV1uwSxPP6A@mail.gmail.com>
	<BANLkTikp9OAXUFwcvV24x=d7ts3G3VR4yQ@mail.gmail.com>
	<BANLkTi=_yZXkdodpjHgp5=mowWwK-fTTgA@mail.gmail.com>
Date: Sun, 10 Apr 2011 13:05:28 +0200
Message-ID: <BANLkTingw8JjhSWCHd6WLB_EWNg0cFhk1A@mail.gmail.com>
Subject: Re: [PATCH] flashcp: improve speed & some clean ups
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: Russ Dill <russ.dill@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

@Artem,

Thanks, I will try to do this in smaller chunks. Probably I'll come
with a patch to let the code comply with the coding guidelines first,
then step by step introduce the changes

@Russ,

Thanks for the info. I'll add a warning and make it opt-in.
That way if you know there was no power fail during the erase and you
know what you are doing you can safe some time.

Note that a new patch might take a little while as I am fairly busy
with severa things at the moment.

Best regards, Frans
