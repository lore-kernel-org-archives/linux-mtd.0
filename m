Subject: Re: [PATCH][MTD] Fix incorrect interface code for x16/x32 chips
From: David Woodhouse <dwmw2@infradead.org>
To: Bartlomiej Sieka <tur@semihalf.com>
In-Reply-To: <4785E372.9010409@semihalf.com>
References: <20071126175517.GA1221@frozen.semihalf.com>
	<4755E020.4070702@semihalf.com>  <4785E372.9010409@semihalf.com>
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Jan 2008 22:11:03 +0000
Message-Id: <1200003063.2954.4.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Thu, 2008-01-10 at 10:20 +0100, Bartlomiej Sieka wrote:
> Bartlomiej Sieka wrote:
> > Bartlomiej Sieka wrote:
> >> According to "Common Flash Memory Interface Publication 100" dated 
> >> December 1, 2001, the interface code for x16/x32 chips is 0x0005, 
> >> and not 0x0004 used so far.
> >> 
> >> Signed-off-by: Bartlomiej Sieka <tur@semihalf.com>
> > 
> > I'd appreciate some feedback on the status of this patch.
> 
> Hmm, it's been over a month now since the patch has been posted, and
> there haven't been any comments, acceptance/rejection notices, etc. Is
> this a wrong list to post this patch? Did I miss some formal requirement
> or something? Are people just too busy?

Sorry. As Jörn said, I tend to apply patches in bursts. When the merge
window is about to open I try to make sure I catch up. I've applied your
patch now.

Sending it on my girlfriend's birthday and then following up on my
birthday isn't the best way to make sure I pay attention, fwiw :)

-- 
dwmw2
