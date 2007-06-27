Date: Wed, 27 Jun 2007 22:51:23 +0100 (BST)
From: Artem Bityutskiy <dedekind@infradead.org>
To: Ram <vshrirama@gmail.com>
Subject: Re: JFFS2 New bie queries.
In-Reply-To: <8bf247760706270439t1b56157dy9671d903fb3aea8f@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0706272248130.22935@pentafluge.infradead.org>
References: <8bf247760706270439t1b56157dy9671d903fb3aea8f@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 27 Jun 2007, Ram wrote:
> [root@LocalHost user]#df
> Filesystem           1k-blocks      Used Available Use% Mounted on
> /dev/mtdblock8           61440     15508     45932  25% /
> none                     14760        40     14720   0% /tmp
>
> Which i can confirm is Wrong. I have created files in / which are of
> size around 40MB.
> This is reflected by the output of command 'du'
>
> [root@LocalHost user]#du -h
> 39.6M
>
>
> I dont know why both of the commands are giving different sizes.

Because of on the flight compression.
