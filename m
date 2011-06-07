Received: from mail-vx0-f177.google.com ([209.85.220.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QU35U-0000nT-OE
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 20:41:25 +0000
Received: by vxd2 with SMTP id 2so5183540vxd.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Jun 2011 13:41:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1307421266.11104.10.camel@localhost>
References: <1307377091.3112.100.camel@localhost>
	<1307389926-12209-1-git-send-email-mlcreech@gmail.com>
	<1307421266.11104.10.camel@localhost>
Date: Tue, 7 Jun 2011 16:41:16 -0400
Message-ID: <BANLkTikKVMQFxtE0S1VL4-SUPWNydgexLw@mail.gmail.com>
Subject: Re: ubifs_decompress: cannot decompress ...
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: dedekind1@gmail.com
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

On Tue, Jun 7, 2011 at 12:34 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>
> No, I have difficulties reading hexdumps. You have set of good nodes
> following by one broken node. I wanted to see a human-readable dump of
> the good nodes at the beginning of the LEB.
>

Oh I see - sorry, I thought you wanted to debug the corrupted portion.

Here's the output for my corrupt flash:

http://mcreech.com/work/ubifs-2011-06-07.txt

I'll follow up with a patch.

-- 
Matthew L. Creech
