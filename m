Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QSWO5-0001co-My
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2011 15:34:14 +0000
Received: by ewy3 with SMTP id 3so893337ewy.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 03 Jun 2011 08:34:11 -0700 (PDT)
Subject: Re: [PATCH] mkfs.ubifs: trivial: 2.6.40 -> 3.0
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ben Gardiner <bengardiner@nanometrics.ca>
In-Reply-To: <1306936176-24533-1-git-send-email-bengardiner@nanometrics.ca>
References: <1306936176-24533-1-git-send-email-bengardiner@nanometrics.ca>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 03 Jun 2011 18:30:01 +0300
Message-ID: <1307115001.3069.15.camel@localhost>
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

On Wed, 2011-06-01 at 09:49 -0400, Ben Gardiner wrote:
> In commit 04665066ebedb0a31335b525fb5f19df32cb8cfe it was noted that the free
> space fixup feature would be available in kernels 2.6.40 or greater. Since
> then it has been decided that the release following 2.6.39 will be 3.0.
> 
> Replace the instances of 2.6.40 with 3.0.
> 
> Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>

Pushed to mtd-utils.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
