Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Nhey3-0001RF-I5
	for linux-mtd@lists.infradead.org; Wed, 17 Feb 2010 08:09:12 +0000
Subject: Re: [PATCH 2/2]
	s/jffs2_erase_pending_trigger/jffs2_garbage_collect_trigger/
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
In-Reply-To: <OF86F4BB72.5166B23C-ONC12576CD.002B5CD0-C12576CD.002B8ED4@transmode.se>
References: <1266249781-27970-1-git-send-email-Joakim.Tjernlund@transmode.se>
	<1266249781-27970-2-git-send-email-Joakim.Tjernlund@transmode.se>
	<1266310789.11659.199.camel@localhost>
	<OFACBFB4CF.DBE14C44-ONC12576CC.004F427F-C12576CC.004F68EA@transmode.se>
	<1266391103.11659.356.camel@localhost>
	<OF1172D855.9E2C6532-ONC12576CD.0028F2FE-C12576CD.0029AD61@transmode.se>
	<1266392908.11659.359.camel@localhost>
	<OF86F4BB72.5166B23C-ONC12576CD.002B5CD0-C12576CD.002B8ED4@transmode.se>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 17 Feb 2010 10:07:46 +0200
Message-ID: <1266394066.11659.368.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-02-17 at 08:55 +0100, Joakim Tjernlund wrote:
> > OK. I expect you will send the final version of your 2 patches, then
> > I'll put them to my l2 tree, right?
> 
> OK, will do shortly. What is your l2 tree?

It is just my own tree where I collect random mtd stuff, and then dwmw2
picks stuff from there to his tree. It is just some help I provide him.

>  I figured you would
> push this to the mtd tree.

No, I do not maintain mtd, and only David can push stuff there. My tree
is only to help him.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
