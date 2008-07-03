In-Reply-To: <1215065495.6573.106.camel@sauron>
To: dedekind@infradead.org
Subject: Re: Problem mounting a UBIFS volume
MIME-Version: 1.0
Message-ID: <OFA076A4B7.37EB09AD-ON8825747B.002260AE-8825747B.00236165@selinc.com>
From: Bruce_Leonard@selinc.com
Date: Wed, 2 Jul 2008 23:26:35 -0700
Content-Type: text/plain; charset="US-ASCII"
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Artem Bityutskiy <dedekind@infradead.org> wrote on 07/02/2008 11:11:35 PM:

> Hi Bruce,
> 
> On Wed, 2008-07-02 at 22:18 -0700, Bruce_Leonard@selinc.com wrote:
> > Artem,
> > 
> 
> Did you use your MTD 64-bit patch? Did you create a large FS image with
> mkfs.ubifs? How large is the ubifs image?
> 

I have been using the 64-bit patch I'm working on.  I didn't have to make 
(or at least I don't think I have to make) any changes to mkfs.ubifs.  I 
did have to make sure I was at the latest version because of the change to 
UBIFS_FORMAT_VERSION.  The resulting image file from mkfs.ubifs is 
134.2MiB which seems pretty big to me.  The last time I ran mkfs.ubifs the 
image was ~29MiB.  Am I mistaken?  Are there changes I need to make to 
mkfs.ubifs?

Bruce
