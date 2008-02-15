From: "Kyungmin Park" <kmpark@infradead.org>
To: <dedekind@infradead.org>
References: <004601c86fa2$201a78d0$1fa9580a@swcenter.sec.samsung.co.kr>
	<1203065647.23414.6.camel@sauron>
Subject: RE: Abnormal behavior with JFFS2 on latest kernel
Date: Fri, 15 Feb 2008 18:02:23 +0900
Message-ID: <005601c86fb1$7c79f100$1fa9580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: 7bit
In-reply-to: <1203065647.23414.6.camel@sauron>
Cc: 'linux-mtd' <linux-mtd@lists.infradead.org>, linux-kernel@vger.kernel.org
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> On Fri, 2008-02-15 at 16:12 +0900, Kyungmin Park wrote:
> > I got following messages.
> > INFO: task pdflush:56 blocked for more than 120 seconds.
> > "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> >
> > What are the meanings?
> > Too mush running GC in JFFS2 or others?
> 
> Hi Kyungmin,
> 
> did not look at this, but off the top of my head this might be related
> to the latest VFS changes (write_begin()/write_end() instead of
> prepare_write()/commit_write()). Just a hint where you might try to
> look.
> 

Then can I use the ubifs? I mean ubifs is already changed for latest VFS changes.
Now I just want to test new driver with latest kernel.

Thank you,
Kyungmin Park
