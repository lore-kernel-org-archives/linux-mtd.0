Received: from anubis.se.axis.com ([195.60.68.12])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TNt3v-0002GH-6S
 for linux-mtd@lists.infradead.org; Mon, 15 Oct 2012 22:23:05 +0000
Date: Tue, 16 Oct 2012 00:22:48 +0200
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Ezequiel Garcia <elezegarcia@gmail.com>
Subject: Re: Unstable bits CEWG project
In-Reply-To: <CALF0-+XMSfxrXDM0GiEfu0jtDHKv7O0hFPtsZ2=LGUcGz-ctVQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.00.1210160017370.24739@lnxricardw.se.axis.com>
References: <CALF0-+XMSfxrXDM0GiEfu0jtDHKv7O0hFPtsZ2=LGUcGz-ctVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"; format=flowed
Content-Transfer-Encoding: 8BIT
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 15 Oct 2012, Ezequiel Garcia wrote:

> I'm considering to propose myself as a candidate for the CEWG funded
> "Unstable bits" project [1].
>
> I'd like to know if anyone has considered the posibility of adding 
> power-cut emulation to nandsim driver; or if this is just a stupid idea.

I think the idea is good. My only doubts would be how well-defined the 
'unstable bits' behavior in real chips is, in order to be able to model it 
to the required accuracy (i.e. so that the resulting work in the software 
will be viable in a real-life situation ) in nandsim. Although most likely 
even with a fairly basic model quite an improvement could be made in the 
way it is handled.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
