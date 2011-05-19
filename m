Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QMwHY-00015S-Bk
	for linux-mtd@lists.infradead.org; Thu, 19 May 2011 06:00:25 +0000
Received: by ewy3 with SMTP id 3so784259ewy.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 18 May 2011 23:00:22 -0700 (PDT)
Subject: Re: [PATCH] mkfs.ubifs: free-space-fixup: note supported kernels
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
In-Reply-To: <BANLkTimTZOoU6z9xTKANk4sGLMCKaxmy8w@mail.gmail.com>
References: <1305147748-13632-1-git-send-email-mlcreech@gmail.com>
	<1305752243-4095-1-git-send-email-bengardiner@nanometrics.ca>
	<BANLkTimTZOoU6z9xTKANk4sGLMCKaxmy8w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 19 May 2011 08:56:39 +0300
Message-ID: <1305784599.2630.41.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Ben Gardiner <bengardiner@nanometrics.ca>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-05-19 at 01:41 -0400, Matthew L. Creech wrote:
> Thanks Ben, I missed Artem's reply asking for this.
> 
> On Wed, May 18, 2011 at 4:57 PM, Ben Gardiner
> <bengardiner@nanometrics.ca> wrote:
> >
> > Note in the help text and comment that kernel release 2.6.39 is required
> > for the free space fixup to be performed.
> >
> 
> Will it actually be included in 2.6.39?  The flag exists there, but
> I'd assumed the code changes wouldn't be merged until the next cycle.

Hi, indeed, yes, I'm planning to merge this upstream, but in 2.6.40. I'm
sorry for misleading infromation.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
