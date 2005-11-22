Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EebWl-0002uI-Mb
	for linux-mtd@lists.infradead.org; Tue, 22 Nov 2005 12:02:01 -0500
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: Nicolas Pitre <nico@cam.org>
In-Reply-To: <Pine.LNX.4.64.0511221155400.6022@localhost.localdomain>
References: <520AB2AD990DC04082102F77CA17263801CE70B4@dlee03.ent.ti.com>
	<43834421.1050509@yandex.ru>
	<Pine.LNX.4.64.0511221155400.6022@localhost.localdomain>
Content-Type: text/plain
Date: Tue, 22 Nov 2005 20:01:18 +0300
Message-Id: <1132678878.19838.2.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "Artem B. Bityutskiy" <dedekind@yandex.ru>, linux-mtd@lists.infradead.org,
	"Menon, Nishanth" <x0nishan@ti.com>
Subject: Re: Jffs2 issue on latest mtd for Sibley NOR
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-11-22 at 11:57 -0500, Nicolas Pitre wrote:
> > Could you please try to reproduce this on mtdram device which is just an
> > emulator of NOR flash in RAM ?
> 
> That's useless in this case.
> 
OK, fine, then it must be something related to 'Sibley' flash drivers or
the jffs2-to-Sibley port. 

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
